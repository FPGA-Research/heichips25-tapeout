# SPDX-FileCopyrightText: © 2025 Leo Moser <leomoser99@gmail.com>
# SPDX-License-Identifier: Apache-2.0

import os
import math
import random
from pathlib import Path
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import Timer, Edge, RisingEdge, FallingEdge
from cocotb.regression import TestFactory
from cocotb.runner import get_runner

random.seed()

WAIT_CYCLES = random.randint(0, 5)
print(f'WAIT_CYCLES: {WAIT_CYCLES}')

FrameBitsPerRow = 32
MaxFramesPerCol = 20
FrameSelectWidth = 5 # hardcoded, should be based on NumColumns

NumColumns = 6
NumRows = 10

BITSTREAM_START = 0xFAB0FAB1
DESYNC_FLAG = 20

FABRIC_NUM_IO_NORTH = 16
FABRIC_NUM_IO_SOUTH = 16

run_all_zeros   = True
run_all_ones    = True
run_counter     = True
run_passthrough = True
run_sram        = False

def set_fabric_io(dut, value):
    value = value & 0xFFFFFFFF

    dut.io_north_in_i.value = value & 0x0000FFFF
    dut.io_south_in_i.value = (value & 0xFFFF0000) >> 16

def get_fabric_io(dut):
    value = dut.io_north_out_o.value | (dut.io_south_out_o.value << 16)
    
    return value

async def reset_design(dut):
    dut.rst_ni.value = 0
    await ClockCycles(dut.clk_i, 10)
    dut.rst_ni.value = 1

async def set_defaults(dut):
    dut.bitstream_data_i.value = 0
    dut.bitstream_valid_i.value = 0
    
    dut.io_north_in_i.value = 0
    dut.io_south_in_i.value = 0
    
    print('Clearing bitstream!')
    
    # Reset all frames to zero
    await zero_bitstream(dut)
    
    print('Bitstream cleared!')

async def zero_bitstream(dut):
    """
    Upload an all-zeros bitstream in reverse to prevent
    logic loops before uploading a new user design.
    
    For faster clearing enable all FrameStrobe signals
    of a column at once.
    
    Note: Still does not reliably prevent logic loops...
    """

    # Write start of bitstream
    dut.bitstream_valid_i.value = 1
    dut.bitstream_data_i.value = BITSTREAM_START
    await ClockCycles(dut.clk_i, 1)
    
    # Write zero frames in reverse
    for column in reversed(range(NumColumns)):
    
        # Write header, clear all frames of a column at once
        dut.bitstream_data_i.value = column<<(FrameBitsPerRow-FrameSelectWidth) | ((1<<MaxFramesPerCol)-1)
        await ClockCycles(dut.clk_i, 1)

        # Write row data
        dut.bitstream_data_i.value = 0x00000000
        await ClockCycles(dut.clk_i, NumRows)

    # Write desync bit
    dut.bitstream_data_i.value = 1<<DESYNC_FLAG
    await ClockCycles(dut.clk_i, 1)

async def upload_bitstream(dut, name):
    """
    Read data until start of bitstream is detected
    Write data until desync bit is in header
    """

    print(f'Uploading bitstream: {name}')

    with open(f'../../user_designs/{name}/{name}.bit', 'br') as f:

        # Wait for start of bitstream
        while (data := f.read(4)) != None:
            number = int.from_bytes(data, "big")
            if number == BITSTREAM_START:
                print('Start of bitstream')
                
                # Write start of bitstream
                dut.bitstream_valid_i.value = 1
                dut.bitstream_data_i.value = number
                await ClockCycles(dut.clk_i, 1)

                if WAIT_CYCLES:
                    dut.bitstream_valid_i.value = 0
                    await ClockCycles(dut.clk_i, WAIT_CYCLES)

                break
    
        # Read bitstream content
        while 1:
        
            # Read header
            data = f.read(4)
            if data == None:
                break
            header = int.from_bytes(data, "big")
            
            print(f'--- header: 0x{header:08x}')

            # Write header
            dut.bitstream_valid_i.value = 1
            dut.bitstream_data_i.value = header
            await ClockCycles(dut.clk_i, 1)
            
            if WAIT_CYCLES:
                dut.bitstream_valid_i.value = 0
                await ClockCycles(dut.clk_i, WAIT_CYCLES)

            # Desync
            if header & (1<<DESYNC_FLAG):
                print("Detected desync flag!")
                break
            
            # Read row data
            for i in range(NumRows):
                row_data = int.from_bytes(f.read(4), "big")
                
                print(f'0x{row_data:08x}')
                
                # Write row data
                dut.bitstream_valid_i.value = 1
                dut.bitstream_data_i.value = row_data
                await ClockCycles(dut.clk_i, 1)
                
                if WAIT_CYCLES:
                    dut.bitstream_valid_i.value = 0
                    await ClockCycles(dut.clk_i, WAIT_CYCLES)
        
        print(f'Bitstream upload completed')
        
        # Stop the bitstream
        dut.bitstream_valid_i.value = 0
        dut.bitstream_data_i.value = 0
        await ClockCycles(dut.clk_i, 1)

@cocotb.test(skip=True)
async def test_default(dut):
    """No bitstream loaded"""

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Assign default values
    await set_defaults(dut)
    await reset_design(dut)
    dut._log.info("Reset done")
    
    await ClockCycles(dut.clk_i, 10)

@cocotb.test(skip=run_all_zeros==False)
async def test_all_zeros(dut):
    """Load bitstream to set output to zero"""

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Assign default values
    await set_defaults(dut)
    await reset_design(dut)
    dut._log.info("Reset done")
    
    await upload_bitstream(dut, 'all_zeros')
    
    values = [random.randint(0,(1<<32)-1) for _ in range(10)]
    
    for value in values:
        set_fabric_io(dut, value)
        await ClockCycles(dut.clk_i, 1)
        assert(get_fabric_io(dut) == 0)
    
    await ClockCycles(dut.clk_i, 10)

@cocotb.test(skip=run_all_ones==False)
async def test_all_ones(dut):
    """Load bitstream to set output to ones"""

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Assign default values
    await set_defaults(dut)
    await reset_design(dut)
    dut._log.info("Reset done")
    
    await upload_bitstream(dut, 'all_ones')

    values = [random.randint(0,(1<<32)-1) for _ in range(10)]
    
    for value in values:
        set_fabric_io(dut, value)
        await ClockCycles(dut.clk_i, 1)
        assert(get_fabric_io(dut) == (1<<32)-1)
    
    await ClockCycles(dut.clk_i, 10)

@cocotb.test(skip=run_counter==False)
async def test_counter(dut):
    """Load bitstream for counter"""

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Assign default values
    await set_defaults(dut)
    await reset_design(dut)
    dut._log.info("Reset done")
    
    await upload_bitstream(dut, 'counter')
    
    set_fabric_io(dut, 1)
    await ClockCycles(dut.clk_i, 5)
    set_fabric_io(dut, 0)
    
    MAX_CNT = 30
    
    await ClockCycles(dut.clk_i, MAX_CNT)
    assert(get_fabric_io(dut) == MAX_CNT-1)

@cocotb.test(skip=run_passthrough==False)
async def test_passthrough(dut):
    """Load bitstream for test_passthrough"""

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Assign default values
    await set_defaults(dut)
    await reset_design(dut)
    dut._log.info("Reset done")

    await upload_bitstream(dut, 'passthrough')
    
    values = [random.randint(0,(1<<32)-1) for _ in range(10)]
    
    for value in values:
        set_fabric_io(dut, value)
        await ClockCycles(dut.clk_i, 1)
        assert(get_fabric_io(dut) == value)
    
    await ClockCycles(dut.clk_i, 10)

@cocotb.test(skip=run_sram==False)
async def test_sram(dut):
    """Load bitstream for test_sram"""

    # Start the clock
    c = Clock(dut.clk_i, 10, 'ns')
    await cocotb.start(c.start())

    # Assign default values
    await set_defaults(dut)
    await reset_design(dut)
    dut._log.info("Reset done")

    await upload_bitstream(dut, 'sram')
    
    data = [random.randint(0, 2**16-1) for _ in range(7)]
    
    REN_BIT = 31
    WEN_BIT = 30
    SRAM_SELECT_OFFSET = 26
    
    for i, word in enumerate(data):
    
        # Select sram and write value
        set_fabric_io(dut, 1<<WEN_BIT | i<<SRAM_SELECT_OFFSET | word)
        await ClockCycles(dut.clk_i, 1)
    
    for i, word in enumerate(data):
    
        set_fabric_io(dut, 1<<REN_BIT | i<<SRAM_SELECT_OFFSET)
        await ClockCycles(dut.clk_i, 2)
        
        print(get_fabric_io(dut))
    
        # Test the correct output of each sram
        assert(get_fabric_io(dut) == word)
    
    await ClockCycles(dut.clk_i, 10)

if __name__ == "__main__":

    sim = os.getenv("SIM", "icarus")
    pdk_root = os.getenv("PDK_ROOT", "~/.ciel")
    pdk = os.getenv("PDK", "ihp-sg13g2")
    scl = os.getenv("SCL", "sg13g2_stdcell")
    gl = os.getenv("GL", None)

    proj_path = Path(__file__).resolve().parent
    
    # Add fabric wrapper, fabric config and tb wrapper
    sources = [
        '../rtl/fabric_wrapper.sv',
        '../../fabric_config/fabric_config.sv',
        'tb_icarus.sv',
        
        # User projects
        proj_path / '../../user_projects/heichips25_example_large/src/heichips25_example_large.sv',
        proj_path / '../../user_projects/heichips25_example_small/src/heichips25_example_small.sv',
        
        # SRAM models
        Path(pdk_root).expanduser() / pdk / "libs.ref" / "sg13g2_sram" / "verilog" / "RM_IHPSG13_1P_512x32_c2_bm_bist.v",
        Path(pdk_root).expanduser() / pdk / "libs.ref" / "sg13g2_sram" / "verilog" / "RM_IHPSG13_1P_core_behavioral_bm_bist.v",
    ]
    
    # Add tiles
    TILES_ROOT = '../../tile_library/tiles'

    if gl:
        # GL does not work because of pessimistic x-propagation!
        sources.append(f'../macro/{pdk}/nl/eFPGA.nl.v')
        sources.append(Path(pdk_root).expanduser() / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v" )
        
        sources.append(f'{TILES_ROOT}/LUT4AB/macro/{pdk}/nl/LUT4AB.nl.v')
        sources.append(f'{TILES_ROOT}/E_TT_IF/macro/{pdk}/nl/E_TT_IF.nl.v')
        sources.append(f'{TILES_ROOT}/W_TT_IF/macro/{pdk}/nl/W_TT_IF.nl.v')
        sources.append(f'{TILES_ROOT}/N_IO4/macro/{pdk}/nl/N_IO4.nl.v')
        sources.append(f'{TILES_ROOT}/S_IO4/macro/{pdk}/nl/S_IO4.nl.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/macro/{pdk}/nl/IHP_SRAM.nl.v')
        sources.append(f'{TILES_ROOT}/NE_term/macro/{pdk}/nl/NE_term.nl.v')
        sources.append(f'{TILES_ROOT}/SE_term/macro/{pdk}/nl/SE_term.nl.v')
        sources.append(f'{TILES_ROOT}/NW_term/macro/{pdk}/nl/NW_term.nl.v')
        sources.append(f'{TILES_ROOT}/SW_term/macro/{pdk}/nl/SW_term.nl.v')
    else:
        # Add fabric
        sources.append(f'../macro/{pdk}/fabulous/eFPGA.v')
        
        # Add primitives
        PRIMITIVES_ROOT = proj_path / '../../tile_library/primitives'
        
        # TT_PROJECT
        sources.append(f'{PRIMITIVES_ROOT}/TT_PROJECT/TT_PROJECT.v')

        # Add tiles
        
        # LUT4AB
        sources.append(f'{TILES_ROOT}/LUT4AB/LUT4AB.v')
        sources.append(f'{TILES_ROOT}/LUT4AB/LUT4AB_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/LUT4AB/LUT4AB_switch_matrix.v')
        sources.append(f'{TILES_ROOT}/LUT4AB/LUT4c_frame_config_dffesr.v')
        sources.append(f'{TILES_ROOT}/LUT4AB/MUX8LUT_frame_config_mux.v')
        
        # E_TT_IF
        sources.append(f'{TILES_ROOT}/E_TT_IF/E_TT_IF.v')
        sources.append(f'{TILES_ROOT}/E_TT_IF/E_TT_IF_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/E_TT_IF/E_TT_IF_switch_matrix.v')
        
        # W_TT_IF
        sources.append(f'{TILES_ROOT}/W_TT_IF/W_TT_IF.v')
        sources.append(f'{TILES_ROOT}/W_TT_IF/W_TT_IF_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/W_TT_IF/W_TT_IF_switch_matrix.v')
        
        # N_IO4
        sources.append(f'{TILES_ROOT}/N_IO4/N_IO4.v')
        sources.append(f'{TILES_ROOT}/N_IO4/N_IO4_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/N_IO4/N_IO4_switch_matrix.v')
        sources.append(f'{TILES_ROOT}/N_IO4/IO_1_bidirectional_frame_config_pass.v')
        
        # S_IO4
        sources.append(f'{TILES_ROOT}/S_IO4/S_IO4.v')
        sources.append(f'{TILES_ROOT}/S_IO4/S_IO4_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/S_IO4/S_IO4_switch_matrix.v')
        
        # IHP_SRAM
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_bot.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_bot_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_bot_switch_matrix.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_1024x32.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_top/IHP_SRAM_top.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_top/IHP_SRAM_top_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_top/IHP_SRAM_top_switch_matrix.v')
        
        # NE_term
        sources.append(f'{TILES_ROOT}/NE_term/NE_term.v')
        sources.append(f'{TILES_ROOT}/NE_term/NE_term_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/NE_term/NE_term_switch_matrix.v')
        
        # SE_term
        sources.append(f'{TILES_ROOT}/SE_term/SE_term.v')
        sources.append(f'{TILES_ROOT}/SE_term/SE_term_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/SE_term/SE_term_switch_matrix.v')
        
        # NW_term
        sources.append(f'{TILES_ROOT}/NW_term/NW_term.v')
        sources.append(f'{TILES_ROOT}/NW_term/NW_term_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/NW_term/NW_term_switch_matrix.v')
        
        # SW_term
        sources.append(f'{TILES_ROOT}/SW_term/SW_term.v')
        sources.append(f'{TILES_ROOT}/SW_term/SW_term_ConfigMem.v')
        sources.append(f'{TILES_ROOT}/SW_term/SW_term_switch_matrix.v')

        sources.append('../../tile_library/models_pack.v')

    hdl_toplevel = "tb"

    runner = get_runner(sim)
    runner.build(
        sources=sources,
        hdl_toplevel=hdl_toplevel,
        defines={'COCOTB': True, 'FUNCTIONAL': True, 'UNIT_DELAY': '#0'},
        always=True,
    )

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="tb_cocotb,",
        plusargs=['-fst'],
        waves=True
    )
