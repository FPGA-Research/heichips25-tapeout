# SPDX-FileCopyrightText: © 2025 Leo Moser <leomoser99@gmail.com>
# SPDX-License-Identifier: Apache-2.0

import os
import random
import cocotb
from pathlib import Path
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from cocotb.triggers import Timer, Edge, RisingEdge, FallingEdge
from cocotb.regression import TestFactory
from cocotb.runner import get_runner

from cocotbext.spi import SpiBus, SpiConfig, SpiMaster

fpga_all_ones = {
    'flash1_slot0': '',
    'flash1_slot1': '',
    'connect_flash1': False,
    'dump_waveforms': False,
}

fpga_all_zeros = {
    'flash1_slot0': '../../../ip/fabric/user_designs/all_zeros/all_zeros.hex',
    'flash1_slot1': '',
    'connect_flash1': True,
    'dump_waveforms': True,
}

fpga_counter_top = {
    'flash1_slot0': '../../../ip/fabric/user_designs/counter_top/counter_top.hex',
    'flash1_slot1': '',
    'connect_flash1': True,
    'dump_waveforms': True,
}

enabled = fpga_counter_top

async def start_clock(clock, freq=50):
    """ Start the clock @ freq MHz """
    c = Clock(clock, 1/freq*1000, 'ns')
    await cocotb.start(c.start())

async def reset(reset, active_low=True, time_ns=1000):
    """ Reset dut """
    cocotb.log.info("Reset asserted...")
    
    reset.value = not active_low
    await Timer(time_ns, "ns")
    reset.value = active_low
    
    cocotb.log.info("Reset deasserted.")

async def start_up(dut):
    """ Startup sequence """
    await start_clock(dut.fpga_clk_PAD)
    await reset(dut.fpga_rst_n_PAD)

async def write_bitstream_spi(filename, spi_master):
    with open(filename, 'br') as f:
        data = f.read(4)
        while data:
            number = int.from_bytes(data, "big")
            
            number_bytes = []            
            for _ in range(4):
                number_bytes.append((number & 0xFF000000) >> 24)
                number = number << 8
            
            print(f'Bitstream data: {number_bytes}')
            await spi_master.write(number_bytes)

            data = f.read(4)

@cocotb.test(skip=enabled!=fpga_all_zeros)
async def test_fpga_all_zeros(dut):
    """Run the all_zeros FPGA bitstream"""

    # Static setup
    dut.fpga_mode_PAD.value = 0 # Configure FPGA as controller
    dut.fpga_config_slot_PAD.value = 0
    dut.fpga_config_trigger_PAD.value = 0

    # Start up
    await start_up(dut)
    
    print("Waiting for configuration to start.")
    await RisingEdge(dut.fpga_config_busy_PAD)
    print("Waiting for configuration to end.")
    await FallingEdge(dut.fpga_config_busy_PAD)
    
    print("FPGA configured!")
    
    assert(dut.fpga_io_PAD.value == 0x00000000)

@cocotb.test(skip=enabled!=fpga_all_ones)
async def test_fpga_all_ones(dut):
    """Run the all_ones FPGA bitstream"""

    # Setup SPI
    spi_bus = SpiBus.from_prefix(dut, "fpga", bus_separator="_", sclk_name="sclk_PAD", cs_name="cs_n_PAD", mosi_name='mosi_PAD', miso_name='miso_PAD')

    spi_config = SpiConfig(
        word_width = 8,
        sclk_freq  = 10e6,
        cpol       = False,
        cpha       = True,
        msb_first  = True,
        frame_spacing_ns = 500
    )

    spi_master = SpiMaster(spi_bus, spi_config)

    # Static setup
    dut.fpga_mode_PAD.value = 1 # Configure FPGA as receiver
    dut.fpga_config_slot_PAD.value = 0
    dut.fpga_config_trigger_PAD.value = 0

    # Start up
    await start_up(dut)

    print("Writing bitstream via SPI!")

    # Configure FPGA via SPI
    spi_coroutine = await cocotb.start(write_bitstream_spi('../../../ip/fabric/user_designs/all_ones/all_ones.bit', spi_master))

    # Wait until FPGA is configured
    await spi_coroutine
    
    print("FPGA configured!")
    
    await ClockCycles(dut.fpga_clk_PAD, 10)
    
    assert(dut.fpga_config_busy_PAD.value == 0)
    assert(dut.fpga_io_PAD.value == 0xFFFFFFFF)

@cocotb.test(skip=enabled!=fpga_counter_top)
async def test_fpga_counter_top(dut):
    """Run the counter_top FPGA bitstream"""

    # Static setup
    dut.fpga_mode_PAD.value = 0 # Configure FPGA as controller
    dut.fpga_config_slot_PAD.value = 0
    dut.fpga_config_trigger_PAD.value = 0

    # Start up
    await start_up(dut)
    
    print("Waiting for configuration to start.")
    await RisingEdge(dut.fpga_config_busy_PAD)
    print("Waiting for configuration to end.")
    await FallingEdge(dut.fpga_config_busy_PAD)
    
    print("FPGA configured!")
    
    dut.fpga_io_PAD[31].value = 1 # Assert design reset
    await ClockCycles(dut.fpga_clk_PAD, 5)
    dut.fpga_io_PAD[31].value = 0 # Deassert design reset
    
    MAX_CNT = 30
    
    await ClockCycles(dut.fpga_clk_PAD, MAX_CNT)
    assert(dut.fpga_io_PAD.value == MAX_CNT-1)

if __name__ == "__main__":

    sim         = os.getenv("SIM", "icarus")
    pdk_root    = os.getenv("PDK_ROOT", "~/.ciel")
    pdk         = os.getenv("PDK", "ihp-sg13g2")
    scl         = os.getenv("SCL", "sg13g2_stdcell")
    gl          = os.getenv("GL", False)

    testbench_path = Path(__file__).resolve().parent
    
    includes = [testbench_path / '../../rtl/include']
    
    verilog_sources = [
        testbench_path / 'heichips25_top_tb.v',
        testbench_path / 'spiflash_powered.v',
        
        # User projects
        testbench_path / '../../ip/user_projects/heichips25_example_large/src/heichips25_example_large.sv',
        testbench_path / '../../ip/user_projects/heichips25_example_small/src/heichips25_example_small.sv',
        
        # SRAM models
        Path(pdk_root).expanduser() / pdk / "libs.ref" / "sg13g2_sram" / "verilog" / "RM_IHPSG13_1P_512x32_c2_bm_bist.v",
        Path(pdk_root).expanduser() / pdk / "libs.ref" / "sg13g2_sram" / "verilog" / "RM_IHPSG13_1P_core_behavioral_bm_bist.v",
        
        # IO Pad models
        Path(pdk_root).expanduser() / pdk / "libs.ref" / "sg13g2_io" / "verilog" / "sg13g2_io.v",
        
    ]
    defines = {}

    if gl:
        # SCL models
        verilog_sources.append(Path(pdk_root).expanduser() / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v" )
        
        verilog_sources.append(testbench_path / '../../final/nl_edit/heichips25_top.nl.v')
        
        defines = {'FUNCTIONAL': True, 'UNIT_DELAY': '#0'}
    else:
        verilog_sources.extend([
            testbench_path / '../../src/heichips25_top.v',
            testbench_path / '../../src/heichips25_core.sv',
            
            testbench_path / '../../ip/fabric/rtl/fabric_wrapper.sv',
            testbench_path / '../../ip/fabric_config/fabric_config.sv',
            testbench_path / '../../ip/fabric_config/fabric_spi_receiver.sv',
            testbench_path / '../../ip/fabric_config/fabric_spi_controller.sv',
        ])
        
        defines = {'RTL': True, 'FUNCTIONAL': True, 'UNIT_DELAY': '#0'}
        
    # Add FPGA fabric
    verilog_sources.append(testbench_path / f'../../ip/fabric/macro/{pdk}/fabulous/eFPGA.v')

    # Add primitives
    PRIMITIVES_ROOT = testbench_path / '../../ip/tile_library/primitives'
    
    # TT_PROJECT
    verilog_sources.append(f'{PRIMITIVES_ROOT}/TT_PROJECT/TT_PROJECT.v')

    # Add tiles
    TILES_ROOT = testbench_path / '../../ip/tile_library/tiles'
    
    # LUT4AB
    verilog_sources.append(f'{TILES_ROOT}/LUT4AB/LUT4AB.v')
    verilog_sources.append(f'{TILES_ROOT}/LUT4AB/LUT4AB_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/LUT4AB/LUT4AB_switch_matrix.v')
    verilog_sources.append(f'{TILES_ROOT}/LUT4AB/LUT4c_frame_config_dffesr.v')
    verilog_sources.append(f'{TILES_ROOT}/LUT4AB/MUX8LUT_frame_config_mux.v')
    
    # E_TT_IF
    verilog_sources.append(f'{TILES_ROOT}/E_TT_IF/E_TT_IF.v')
    verilog_sources.append(f'{TILES_ROOT}/E_TT_IF/E_TT_IF_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/E_TT_IF/E_TT_IF_switch_matrix.v')
    
    # W_TT_IF
    verilog_sources.append(f'{TILES_ROOT}/W_TT_IF/W_TT_IF.v')
    verilog_sources.append(f'{TILES_ROOT}/W_TT_IF/W_TT_IF_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/W_TT_IF/W_TT_IF_switch_matrix.v')
    
    # N_IO4
    verilog_sources.append(f'{TILES_ROOT}/N_IO4/N_IO4.v')
    verilog_sources.append(f'{TILES_ROOT}/N_IO4/N_IO4_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/N_IO4/N_IO4_switch_matrix.v')
    verilog_sources.append(f'{TILES_ROOT}/N_IO4/IO_1_bidirectional_frame_config_pass.v')
    
    # S_IO4
    verilog_sources.append(f'{TILES_ROOT}/S_IO4/S_IO4.v')
    verilog_sources.append(f'{TILES_ROOT}/S_IO4/S_IO4_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/S_IO4/S_IO4_switch_matrix.v')
    
    # IHP_SRAM
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM.v')
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_bot.v')
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_bot_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_bot_switch_matrix.v')
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_bot/IHP_SRAM_1024x32.v')
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_top/IHP_SRAM_top.v')
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_top/IHP_SRAM_top_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/IHP_SRAM/IHP_SRAM_top/IHP_SRAM_top_switch_matrix.v')
    
    # NE_term
    verilog_sources.append(f'{TILES_ROOT}/NE_term/NE_term.v')
    verilog_sources.append(f'{TILES_ROOT}/NE_term/NE_term_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/NE_term/NE_term_switch_matrix.v')
    
    # SE_term
    verilog_sources.append(f'{TILES_ROOT}/SE_term/SE_term.v')
    verilog_sources.append(f'{TILES_ROOT}/SE_term/SE_term_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/SE_term/SE_term_switch_matrix.v')
    
    # NW_term
    verilog_sources.append(f'{TILES_ROOT}/NW_term/NW_term.v')
    verilog_sources.append(f'{TILES_ROOT}/NW_term/NW_term_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/NW_term/NW_term_switch_matrix.v')
    
    # SW_term
    verilog_sources.append(f'{TILES_ROOT}/SW_term/SW_term.v')
    verilog_sources.append(f'{TILES_ROOT}/SW_term/SW_term_ConfigMem.v')
    verilog_sources.append(f'{TILES_ROOT}/SW_term/SW_term_switch_matrix.v')

    verilog_sources.append(testbench_path / '../../ip/tile_library/models_pack.v')

    defines['USE_POWER_PINS'] = True
    
    if enabled["connect_flash1"]:
        defines['BITSTREAM_FLASH'] = True
    
    if enabled["dump_waveforms"]:
        defines['DUMP_WAVEFORMS'] = True
    
    hdl_toplevel = "heichips25_top_tb"

    build_args = []

    if sim == 'icarus':
        build_args = ['-Winfloop']

    if sim == 'verilator':
        build_args = ['--timing', '--trace', '--trace-fst', '--trace-structs']

    runner = get_runner(sim)
    runner.build(
        verilog_sources=verilog_sources,
        hdl_toplevel=hdl_toplevel,
        defines=defines,
        always=True,
        includes=includes,
        build_args=build_args,
    )

    plusargs = []
    plusargs += [f'+flash1_slot0={enabled["flash1_slot0"]}']
    plusargs += [f'+flash1_slot1={enabled["flash1_slot1"]}']

    if sim == 'icarus':
        plusargs += ['-fst']

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="heichips25_top_tb,",
        plusargs=plusargs,
        waves=True,
    )
