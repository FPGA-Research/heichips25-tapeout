# SPDX-FileCopyrightText: © 2026 FABulous Contributors
# SPDX-FileCopyrightText: © 2025 Leo Moser <leomoser99@gmail.com>
# SPDX-License-Identifier: Apache-2.0

import os
import re
import sys
import math
import random
from pathlib import Path
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer, Edge, RisingEdge, FallingEdge
from cocotb.regression import TestFactory
from cocotb_tools.runner import get_runner
from cocotb.types import LogicArray, Logic

from cocotbext.spi import SpiBus, SpiConfig, SpiMaster

proj_path = Path(__file__).resolve().parent
fabric = os.getenv("FABRIC", "classic_fabric_heichips25")
tile_library = os.getenv("TILE_LIBRARY", "classic")
emulation = os.getenv("EMULATION", False)

lookup = {
    "X1Y10/A" : "fpga_io_PAD_0",
    "X1Y10/B" : "fpga_io_PAD_1",
    "X1Y10/C" : "fpga_io_PAD_2",
    "X1Y10/D" : "fpga_io_PAD_3",
    "X2Y10/A" : "fpga_io_PAD_4",
    "X2Y10/B" : "fpga_io_PAD_5",
    "X2Y10/C" : "fpga_io_PAD_6",
    "X2Y10/D" : "fpga_io_PAD_7",
    "X3Y10/A" : "fpga_io_PAD_8",
    "X3Y10/B" : "fpga_io_PAD_9",
    "X3Y10/C" : "fpga_io_PAD_10",
    "X3Y10/D" : "fpga_io_PAD_11",
    "X4Y10/A" : "fpga_io_PAD_12",
    "X4Y10/B" : "fpga_io_PAD_13",
    "X4Y10/C" : "fpga_io_PAD_14",
    "X4Y10/D" : "fpga_io_PAD_15",
    
    "X1Y0/A" : "fpga_io_PAD_16",
    "X1Y0/B" : "fpga_io_PAD_17",
    "X1Y0/C" : "fpga_io_PAD_18",
    "X1Y0/D" : "fpga_io_PAD_19",
    "X2Y0/A" : "fpga_io_PAD_20",
    "X2Y0/B" : "fpga_io_PAD_21",
    "X2Y0/C" : "fpga_io_PAD_22",
    "X2Y0/D" : "fpga_io_PAD_23",
    "X3Y0/A" : "fpga_io_PAD_24",
    "X3Y0/B" : "fpga_io_PAD_25",
    "X3Y0/C" : "fpga_io_PAD_26",
    "X3Y0/D" : "fpga_io_PAD_27",
    "X4Y0/A" : "fpga_io_PAD_28",
    "X4Y0/B" : "fpga_io_PAD_29",
    "X4Y0/C" : "fpga_io_PAD_30",
    "X4Y0/D" : "fpga_io_PAD_31",
}

async def clear_bitstream_spi(spi_master):
    if emulation:
        return

    print("Clearing the bitstream...")

    FRAME_BITS_PER_ROW = 32
    MAX_FRAMES_PER_COL = 20
    FRAME_SELECT_WIDTH = 5 # hardcoded, should be based on FABRIC_NUM_COLUMNS

    BITSTREAM_START = 0xFAB0FAB1
    DESYNC_FLAG = 20

    NUM_ROWS = 11
    NUM_COLUMNS = 6

    # Header
    await spi_master.write([0xFA, 0xB0, 0xFA, 0xB1])

    for column in reversed(range(NUM_COLUMNS)):
        for frame in reversed(range(MAX_FRAMES_PER_COL)):
            header = (column & 0x1F) << 27 | (1<<frame) & 0xFFFFF
            header_bytes = [(header & 0xFF000000) >> 24, (header & 0xFF0000) >> 16, (header & 0xFF00) >> 8, header & 0xFF]
            await spi_master.write(header_bytes)

            for row in reversed(range(NUM_ROWS)):
                await spi_master.write([0x00, 0x00, 0x00, 0x00])
    
    header = 1 << DESYNC_FLAG
    header_bytes = [(header & 0xFF000000) >> 24, (header & 0xFF0000) >> 16, (header & 0xFF00) >> 8, header & 0xFF]
    await spi_master.write(header_bytes)

async def upload_bitstream_spi(bitstream_path, spi_master):
    if emulation:
        return

    print("Writing the bitstream...")

    with open(bitstream_path, 'br') as f:
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

class PCF:
    "A class to read a PCF file and access the signals within cocotb."

    def __init__(self, dut, file, lookup):
        self.signals = {}
        self.top = dut._name
        print(f"Reading PCF file: {file}")
        with open(file, "r") as pcf_file:
            while line := pcf_file.readline():
                if match := re.match(r"\s*set_io\s+(?P<signal>\w+)(\[(?P<index>\d+)?\])?\s+X(?P<tilex>\d+)Y(?P<tiley>\d+)\/(?P<bel>\w+)", line):
                    signal = match.group("signal")
                    index = match.group("index")
                    tile_x = match.group("tilex")
                    tile_y = match.group("tiley")
                    bel = match.group("bel")

                    tile_bel = f"X{tile_x}Y{tile_y}/{bel}"
                    top_pad = lookup[tile_bel]
                    top_handle = eval(f"dut.{top_pad}", locals=dict(dut=dut))

                    if index is None:
                        index = 0
                    else:
                        index = int(index)
                    
                    # Add an index to a signal
                    if signal in self.signals:
                        self.signals[signal][index] = top_handle

                        # Sort by index
                        self.signals[signal] = dict(sorted(self.signals[signal].items()))
                    # Add a new signal
                    else:
                        self.signals[signal] = {
                             index: top_handle
                        }

    def write_gtkw(self, path, filter=None):
        "Write a gtkwave save file in order to view the selected signals"
        with open(path, "w") as outfile:
            outfile.write(f"@28\n")
            for signal_name, signal in self.signals.items():
                if filter is not None and signal_name in filter:
                    if len(signal) == 1:
                        outfile.write(f"#{{{signal_name}}} {self.top}.{signal[0]._name}\n")
                        outfile.write(f"@200\n")
                        outfile.write(f"-\n")
                        outfile.write(f"@28\n")
                    else:
                        bits = len(signal)
                        signals = [ self.top + "." + signal._name for index, signal in reversed(signal.items()) ]
                    
                        outfile.write(f"@c00022\n")
                        outfile.write(f"#{{{signal_name}[{bits-1}:0]}} {' '.join(signals)}\n")
                        outfile.write(f"@28\n")
                        for signal in signals:
                            outfile.write(f"{signal}\n")
                        outfile.write(f"@1401200\n")
                        outfile.write(f"-group_end\n")

                        outfile.write(f"@200\n")
                        outfile.write(f"-\n")

    def get(self, signal, index=None):
        "Get the value of a signal"
        #print(f"get {signal} {index}")
    
        # Get the full signal
        if index is None:
            return LogicArray("".join(str(bit.value) for bit in reversed(self.signals[signal].values())))
        # Get a single bit
        else:
            return Logic(self.signals[signal][index].value)
    
    def set(self, signal, value, index=None):
        "Set the value of a signal"
        #print(f"set {signal} {value} {index}")
        
        # Get the full signal
        if index is None:
            for index, bit in enumerate(reversed(value)):
                self.signals[signal][index].value = bit
        else:
            self.signals[signal][index].value = value

    def get_raw(self, signal, use, index=0):
        "Get the raw cocotb signal. Can be used for triggers."
        return self.signals[signal][index]

@cocotb.test()
async def test_all_ones(dut):
    """Load bitstream for all_ones"""

    testname = "all_ones"

    pcf = PCF(dut, proj_path / f"../fabrics/{fabric}/constraints.pcf", lookup)
    pcf.write_gtkw(f"{testname}.gtkw", ["all"])

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

    cocotb.start_soon(Clock(dut.fpga_clk_PAD, 10, 'ns').start())

    # Assert reset
    dut.fpga_rst_n_PAD.value = 0
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Deassert reset
    dut.fpga_rst_n_PAD.value = 1
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Configure FPGA via SPI
    await cocotb.start_soon(clear_bitstream_spi(spi_master))
    await cocotb.start_soon(upload_bitstream_spi(proj_path / f'../user_designs/designs/{tile_library}/{testname}/{testname}.bit', spi_master))
    await ClockCycles(dut.fpga_clk_PAD, 10)

    assert pcf.get("all").to_unsigned() == LogicArray.from_signed(-1, len(pcf.get("all")))

@cocotb.test()
async def test_all_zeros(dut):
    """Load bitstream for all_zeros"""

    testname = "all_zeros"

    pcf = PCF(dut, proj_path / f"../fabrics/{fabric}/constraints.pcf", lookup)
    pcf.write_gtkw(f"{testname}.gtkw", ["all"])

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

    cocotb.start_soon(Clock(dut.fpga_clk_PAD, 10, 'ns').start())

    # Assert reset
    dut.fpga_rst_n_PAD.value = 0
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Deassert reset
    dut.fpga_rst_n_PAD.value = 1
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Configure FPGA via SPI
    await cocotb.start_soon(clear_bitstream_spi(spi_master))
    await cocotb.start_soon(upload_bitstream_spi(proj_path / f'../user_designs/designs/{tile_library}/{testname}/{testname}.bit', spi_master))
    await ClockCycles(dut.fpga_clk_PAD, 10)

    assert pcf.get("all").to_unsigned() == LogicArray.from_unsigned(0, len(pcf.get("all")))

@cocotb.test()
async def test_passthrough(dut):
    """Load bitstream for passthrough"""

    testname = "passthrough"

    pcf = PCF(dut, proj_path / f"../fabrics/{fabric}/constraints.pcf", lookup)
    pcf.write_gtkw(f"{testname}.gtkw", ["a", "b"])

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

    cocotb.start_soon(Clock(dut.fpga_clk_PAD, 10, 'ns').start())

    # Assert reset
    dut.fpga_rst_n_PAD.value = 0
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Deassert reset
    dut.fpga_rst_n_PAD.value = 1
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Configure FPGA via SPI
    await cocotb.start_soon(clear_bitstream_spi(spi_master))
    await cocotb.start_soon(upload_bitstream_spi(proj_path / f'../user_designs/designs/{tile_library}/{testname}/{testname}.bit', spi_master))
    await ClockCycles(dut.fpga_clk_PAD, 10)

    for i in range(32):
        # Get a random value
        value = random.randint(0, 2**len(pcf.get("a"))-1)

        pcf.set("a", LogicArray.from_unsigned(value, len(pcf.get("a"))))
        await Timer(10, unit="ns")
        assert(pcf.get("b").to_unsigned() == value)

@cocotb.test()
async def test_addition(dut):
    """Load bitstream for addition"""

    testname = "addition"

    pcf = PCF(dut, proj_path / f"../fabrics/{fabric}/constraints.pcf", lookup)
    pcf.write_gtkw(f"{testname}.gtkw", ["a", "b", "c"])

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

    cocotb.start_soon(Clock(dut.fpga_clk_PAD, 10, 'ns').start())

    # Assert reset
    dut.fpga_rst_n_PAD.value = 0
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Deassert reset
    dut.fpga_rst_n_PAD.value = 1
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Configure FPGA via SPI
    await cocotb.start_soon(clear_bitstream_spi(spi_master))
    await cocotb.start_soon(upload_bitstream_spi(proj_path / f'../user_designs/designs/{tile_library}/{testname}/{testname}.bit', spi_master))
    await ClockCycles(dut.fpga_clk_PAD, 10)

    for i in range(32):
        # Get a random value
        value_a = random.randint(0, 2**len(pcf.get("a"))-1)
        value_b = random.randint(0, 2**len(pcf.get("b"))-1)
        
        result = value_a + value_b

        pcf.set("a", LogicArray.from_unsigned(value_a, len(pcf.get("a"))))
        pcf.set("b", LogicArray.from_unsigned(value_b, len(pcf.get("b"))))
        
        await Timer(10, unit="ns")
        assert(pcf.get("c").to_unsigned() == result)

@cocotb.test()
async def test_counter(dut):
    """Load bitstream for counter"""

    testname = "counter"

    pcf = PCF(dut, proj_path / f"../fabrics/{fabric}/constraints.pcf", lookup)
    pcf.write_gtkw(f"{testname}.gtkw", ["clk1", "clk2", "rst", "ena", "c"])

    # Reset
    pcf.set("clk1", Logic(0), index=0)
    pcf.set("clk2", Logic(0), index=0)
    pcf.set("rst", Logic(1), index=0)
    pcf.set("ena", Logic(1), index=0)
    await Timer(10, unit="ns")

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

    cocotb.start_soon(Clock(dut.fpga_clk_PAD, 10, 'ns').start())

    # Assert reset
    dut.fpga_rst_n_PAD.value = 0
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Deassert reset
    dut.fpga_rst_n_PAD.value = 1
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Configure FPGA via SPI
    await cocotb.start_soon(clear_bitstream_spi(spi_master))
    await cocotb.start_soon(upload_bitstream_spi(proj_path / f'../user_designs/designs/{tile_library}/{testname}/{testname}.bit', spi_master))
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Start a clock on clk1
    clock = pcf.get_raw("clk1", "OUT")
    cocotb.start_soon(Clock(clock, 10, 'ns').start())

    await ClockCycles(clock, 10)
    
    pcf.set("rst", Logic(0), index=0)
    pcf.set("ena", Logic(0), index=0)

    await ClockCycles(clock, 10)

    pcf.set("ena", Logic(1), index=0)

    NUM_CYCLES = 123
    await ClockCycles(clock, NUM_CYCLES)

    assert pcf.get("c").to_unsigned() == NUM_CYCLES-1

@cocotb.test()
async def test_multiplication(dut):
    """Load bitstream for multiplication"""

    testname = "multiplication"

    pcf = PCF(dut, proj_path / f"../fabrics/{fabric}/constraints.pcf", lookup)
    pcf.write_gtkw(f"{testname}.gtkw", ["a", "b", "product"])

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

    cocotb.start_soon(Clock(dut.fpga_clk_PAD, 10, 'ns').start())

    # Assert reset
    dut.fpga_rst_n_PAD.value = 0
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Deassert reset
    dut.fpga_rst_n_PAD.value = 1
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Configure FPGA via SPI
    await cocotb.start_soon(clear_bitstream_spi(spi_master))
    await cocotb.start_soon(upload_bitstream_spi(proj_path / f'../user_designs/designs/{tile_library}/{testname}/{testname}.bit', spi_master))
    await ClockCycles(dut.fpga_clk_PAD, 10)

    for i in range(32):
        # Get a random value
        value_a = random.randint(0, 2**len(pcf.get("a"))-1)
        value_b = random.randint(0, 2**len(pcf.get("b"))-1)
        
        result = value_a * value_b

        pcf.set("a", LogicArray.from_unsigned(value_a, len(pcf.get("a"))))
        pcf.set("b", LogicArray.from_unsigned(value_b, len(pcf.get("b"))))
        
        await Timer(10, unit="ns")
        assert(pcf.get("product").to_unsigned() == result)

@cocotb.test()
async def test_ihp_sram_1024x32_1rw(dut):
    """Load bitstream for ihp_sram_1024x32_1rw"""

    testname = "ihp_sram_1024x32_1rw"

    pcf = PCF(dut, proj_path / f"../fabrics/{fabric}/constraints.pcf", lookup)
    pcf.write_gtkw(f"{testname}.gtkw", ["clk1", "ram_addr", "ram_byte_sel", "ram_wen", "ram_men", "ram_ren", "ram_din_byte", "ram_dout_byte"])

    # Reset
    pcf.set("clk1", Logic(0), index=0)
    await Timer(10, unit="ns")

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

    cocotb.start_soon(Clock(dut.fpga_clk_PAD, 10, 'ns').start())

    # Assert reset
    dut.fpga_rst_n_PAD.value = 0
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Deassert reset
    dut.fpga_rst_n_PAD.value = 1
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Configure FPGA via SPI
    await cocotb.start_soon(clear_bitstream_spi(spi_master))
    await cocotb.start_soon(upload_bitstream_spi(proj_path / f'../user_designs/designs/{tile_library}/{testname}/{testname}.bit', spi_master))
    await ClockCycles(dut.fpga_clk_PAD, 10)

    # Start a clock on clk1
    clock1 = pcf.get_raw("clk1", "OUT")
    cocotb.start_soon(Clock(clock1, 10, 'ns').start())
    
    await ClockCycles(clock1, 10)
    
    pcf.set("ram_men", Logic(1), index=0)
    pcf.set("ram_wen", Logic(0), index=0)
    pcf.set("ram_ren", Logic(0), index=0)
    pcf.set("ram_addr", LogicArray.from_unsigned(0, len(pcf.get("ram_addr"))))
    pcf.set("ram_byte_sel", LogicArray.from_unsigned(0, len(pcf.get("ram_byte_sel"))))
    pcf.set("ram_din_byte", LogicArray.from_unsigned(0, len(pcf.get("ram_din_byte"))))
    await ClockCycles(clock1, 1)
    
    pcf.set("ram_wen", Logic(1), index=0)
    pcf.set("ram_ren", Logic(0), index=0)
    
    data = [random.randint(0, 2**10-1) for _ in range(100)] # 4 KiB memory

    # Fill the memory with data
    for i in data:
        pcf.set("ram_addr", LogicArray.from_unsigned(i >> 2, len(pcf.get("ram_addr"))))
        pcf.set("ram_byte_sel", LogicArray.from_unsigned(i & 0x3, len(pcf.get("ram_byte_sel"))))
        pcf.set("ram_din_byte", LogicArray.from_unsigned(i & 0xFF, len(pcf.get("ram_din_byte"))))
        
        await ClockCycles(clock1, 1)

    pcf.set("ram_wen", Logic(0), index=0)
    pcf.set("ram_ren", Logic(1), index=0)
    
    # Read the same data
    for i in data:
        pcf.set("ram_addr", LogicArray.from_unsigned(i >> 2, len(pcf.get("ram_addr"))))
        pcf.set("ram_byte_sel", LogicArray.from_unsigned(i & 0x3, len(pcf.get("ram_byte_sel"))))
        await ClockCycles(clock1, 2)

        assert(pcf.get("ram_dout_byte").to_unsigned() == i & 0xFF)

if __name__ == "__main__":

    sim = os.getenv("SIM", "icarus")
    pdk_root = os.getenv("PDK_ROOT", proj_path / "../IHP-Open-PDK/")
    pdk = os.getenv("PDK", "ihp-sg13g2")
    scl = os.getenv("SCL", "sg13g2_stdcell")
    gl = os.getenv("GL", None)
    tile_library = os.getenv("TILE_LIBRARY", "classic")
    
    """if emulation and gl:
        print("Error: EMULATION and GL can't be set at the same time.")
        sys.exit(1)"""
    
    hdl_toplevel = "heichips25_top_tb"
    
    tiles_path = Path(proj_path / ".." / "ip" / "fabulous-tiles")
    primitives_path = Path(tiles_path) / "primitives"
    tile_library_path = Path(tiles_path) / "tiles" / tile_library

    primitives_files = list(primitives_path.glob('**/fabulous/*.v'))
    tile_files = list(tile_library_path.glob(f'**/macro/{pdk}/fabulous/*.v'))

    #print(f"Primitive sources: {primitives_files}")
    #print(f"Tile sources: {tile_files}")
    
    sources = []
    defines = {}
    test_filter = None
    
    sources.extend(primitives_files)
    sources.extend(tile_files)
    
    # TB wrapper
    sources.append(proj_path / f"heichips25_top_tb.v")
    
    # SCL models
    sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"{scl}.v")
    sources.append(Path(pdk_root) / pdk / "libs.ref" / scl / "verilog" / f"sg13g2_udp.v")
    
    # SRAM models
    sources.append(Path(pdk_root) / pdk / "libs.ref" / "sg13g2_sram" / "verilog" / "RM_IHPSG13_1P_512x32_c2_bm_bist.v")
    sources.append(Path(pdk_root) / pdk / "libs.ref" / "sg13g2_sram" / "verilog" / "RM_IHPSG13_1P_core_behavioral_bm_bist.v")

    # IO models
    sources.append(Path(pdk_root) / pdk / "libs.ref" / "sg13g2_io" / "verilog" / "sg13g2_io.v")
        
    # Alignment mark
    sources.append(proj_path / '../ip/alignment_mark/vh/alignment_mark.v')

    # Logos
    sources.append(proj_path / '../ip/logo_fabulous/vh/logo_fabulous.v')
    sources.append(proj_path / '../ip/logo_heichips/vh/logo_heichips.v')
    sources.append(proj_path / '../ip/logo_credits/vh/logo_credits.v')

    # Blackbox user projects
    sources.append(proj_path / '../ip/user_projects/bb_user_projects.v')
    
    # Bondpads
    sources.append(proj_path / '../ip/bondpad_70x70_novias/vh/bondpad_70x70_novias.v')
    
    # gate-level
    if gl:
        # We use the unpowered netlist
        sources.append(proj_path / f"../final/nl/heichips25_top.nl.v")

        #defines["USE_POWER_PINS"] = False
    # RTL
    else:
        sources.append(proj_path / f"../src/heichips25_top.v")
        sources.append(proj_path / f"../src/heichips25_core.sv")
        sources.append(proj_path / f"../src/fabric_wrapper.sv")
        sources.append(proj_path / f"../ip/fabric_config/fabric_config.sv")
        sources.append(proj_path / f"../ip/fabric_config/fabric_spi_controller.sv")
        sources.append(proj_path / f"../ip/fabric_config/fabric_spi_receiver.sv")
    
    if emulation:
        sources.append(proj_path / f'../user_designs/designs/{tile_library}/{emulation}/{emulation}.vh')
        defines["EMULATION"] = True
        test_filter = "test_" + emulation
    
    # Add models pack
    sources.append(tiles_path / "models_pack.v")

    # Add custom cells
    sources.append(tiles_path / "custom.v")

    # Add fabric netlist
    sources.append(proj_path / f'../fabrics/{fabric}/macro/{pdk}/fabulous/{fabric}.v')

    runner = get_runner(sim)
    runner.build(
        sources=sources,
        hdl_toplevel=hdl_toplevel,
        defines=defines,
        always=True,
        clean=True,
        timescale=("1ns", "1ps"),
        waves=True,
    )

    runner.test(
        hdl_toplevel=hdl_toplevel,
        test_module="top_tb",
        plusargs=['-fst'],
        waves=True,
        test_filter=test_filter,
    )
