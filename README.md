# HeiChips 2025 Tapeout

![heichips25.jpg](img/heichips25.jpg)

This repository contains the chip for the [HeiChips Summer School 2025](https://heichips.github.io/). It includes several designs created during the Hackathon all connected to a common eFPGA fabric in the center.
Thanks to FABulous, the user bitstream for the FPGA can be generated using the upstream yosys and nextpnr toolchain.

The chip is designed with open source EDA tools and the [IHP Open Source PDK](https://github.com/IHP-GmbH/IHP-Open-PDK).

> [!WARNING]
> This repository is a Work in Progress.

<p align="center">
  <a href="img/heichips25_top_white.png">
    <img src="img/heichips25_top_white_small.png" alt="chip layout" width=40%>
  </a>
</p>

## Feature Overview

The chip includes several user submitted designs from the HeiChips 2025 Hackathon. In the center of the chip is an eFPGA which allows the user projects to connect to each other, utilize the SRAM or connect to the external I/Os.

- [FABulous](https://github.com/FPGA-Research/FABulous) eFPGA
  - 32x I/Os
  - 288x LUT4 + FF
    - w. carry chain
  - 1x SRAM
    - 4 KiB memory: 32 bit wide, 10 bit deep (1024 entries)
    - individual bit-enable
  - 4x global buffers
  - 1x system reset

The following user projects are included:

| Project | Size | Location | Description | Link |
|---------------|---------------|---------------|---------------|------|
| heichips25_snitch_wrapper | Large | X0Y2          | Snitch RISC‑V (RV32) integer core implemented with LibreLane on IHP SG13G2 (130 nm). | [Link](https://github.com/HeiChips/heichips_25_snitch_core) |
| heichips25_CORDIC | Small | X0Y3          | Waveform + Tone Generation using CORDIC Algorithm. | [Link](https://github.com/HeiChips/heichips25_CORDIC) |
| heichips25_tiny_wrapper2 | Small | X0Y4          | SAP-3 (Simple-As-Possible Computer). </br> FSM: A programmable state machine controller for the Heichips25 tapeout. It can be programmed to implement a wide variety of state machine based designs, such as: Serializer/Deserializer, Pulse Width Modulation (PWM), UART, ... | [Link](https://github.com/HeiChips/heichips25-tiny-wrapper2) |
| heichips25_top_sorter | Small | X0Y5          | A top N sorter (either sorting or finding top N elements) of 28 8-bit numbers at 143 MHz. | [Link](https://github.com/HeiChips/heiChips2025_sap3_and_sorter) |
| heichips25_systolicArrayTop | Small | X0Y6          | Computes the product of two 4x4 matrices. Each input matrix element is a 4-bit unsigned integer. | [Link](https://github.com/HeiChips/heichips25_systolicArray4x4) |
| heichips25_pudding | Small | X0Y7          | DAC for Digital Icy Nano-Ampere-current Generation  | [Link](https://github.com/HeiChips/heichips25-pudding) |
| heichips25_fazyrv_exotiny | Large | X0Y9          | FazyRV ExoTiny CCX implements an minimal-area SoC with custom instruction interface based on the FazyRV RISC-V core. | [Link](https://github.com/HeiChips/heichips25-fazyrv-exotiny) |
| heichips25_internal | Small | X5Y1          | 1. A multimode digital PLL with range from 95MHz to 213MHz input clk multiply up to 5 bits and output clk div up to 5 bits. We have 26 Phase shifts from 0deg to 360deg and 3 output clocks that are phase related to each other. Optionally use a DCO mode to have a free running oscillator that bypasses the controller logic. Output clocks can be XORt with each other to be able to change the duty cycle and at max double frequency. Functionallity confirmed with spice, sdf gatelevel and beh. simulations. </br> 2. Four custom standard cells 2 to 1 muxes and latches. </br> 3. A clock delay line that can delay an input clock this will result in phase shifts. | [Link](https://github.com/HeiChips/heichips25-internal) |
| heichips25_ethernet | Small | X5Y2          | An experimental 10 Mbps Ethernet over custom LVDS, TX-only PHY with an RMII interface and Manchester encoding. Features an MDIO management interface, loopback and bypass test modes, and a simple open-loop differential driver. | [Link](https://github.com/HeiChips/heichips25-ethernet) |
| heichips25_SDR | Small | X5Y3          | Software-Defined Radio System Hardware Acceleration | [Link](https://github.com/HeiChips/heichips25_SDR) |
| heichips25_ICELab | Small | X5Y4          | This chip features a nearly all-digital programmable analog standard cell test infrastructure designed in the open-source iHP 130nm CMOS process. Occupying an area of approximately .5mm^2, the design is optimized for high-density characterization with a minimal footprint of only four analog I/O lines: one output scanner line, two differential input lines, and one pin for current and voltage measurement. The system leverages floating-gate (FG) transistors as programmable elements, utilizing the thick-insulator devices available in the process to enable non-volatile tuning through electron tunneling and hot-electron injection. </br> To support these programming mechanisms without external high-voltage supplies, the chip integrates on-chip Dickson charge pumps, including a positive pump to reach the 8-9V required for tunneling and negative pumps for injection. The internal architecture consists of an array of analog standard cells, such as a Vector-Matrix Multiplier (VMM), a Winner-Take-All (WTA) block, and a small Arbitrary Waveform Generator (AWG), all of which are controlled via a digital infrastructure. For precise measurement and calibration, the chip includes a 6-bit voltage DAC for gate control and a Ramp ADC for automated drain current characterization, providing a complete platform for rapid verification. | [Link](https://github.com/HeiChips/ASHES-IHP130nm) |
| heichips25_bagel | Small | X5Y7          |  bAG O' Life (bAsic Game Of Life) with HDMI output (125 MHz clock, DDR). | [Link](https://github.com/HeiChips/heichips25_bagel) |
| heichips25_tiny_wrapper | Small | X5Y8          | FALU (Fancy ALU) is a custom-designed Arithmetic Logic Unit implemented in Verilog with a flexible interface and extended functionality beyond standard ALUs. It supports not only the typical arithmetic and logic operations, but also more advanced functions like population count, approximate log, and even a tiny “sort” operation. </br> PPWM: This project aims to create a programmable PWM module. In this context, "programmable" signifies that the module is initialized with a set of instructions. These instructions are then executed by its internal state machine, enabling dynamic PWM behavior. This allows for modifications to the PWM characteristics over time. A practical application of this would be, for instance, creating a pulsing LED effect. | [Link](https://github.com/HeiChips/heichips25-tiny-wrapper) |
| heichips25_usb_cdc | Small | X5Y9          | A USB CDC core taken from https://github.com/ulixxe/usb_cdc. USB_CDC is a Verilog implementation of the Full Speed (12Mbit/s) USB communications device class (or USB CDC class). It implements the Abstract Control Model (ACM) subclass. | [Link](https://github.com/HeiChips/heichips25-usb_cdc) |

## Configuration of the FPGA Fabric

The eFPGA fabric can be configured using the SPI peripheral or the SPI controller, depending on the value of `fpga_mode`. If the SPI controller is selected, upon startup it will fetch the bitstream from slot 0 of the external SPI flash. Using the slot input and the trigger one can initiate a reconfiguration. If the SPI peripheral is selected it will wait for bitstream data on the SPI interface upon startup.

## Building User Designs for the eFPGA

To build a bitstream of a user design for the eFPGA, see [README.md](ip/fabric/user_designs/README.md) under `ip/fabric/user_design`.

## Building the Chip

### Prerequisites

> [!NOTE]
> Either clone the repo using the following command: 
>```console
>git clone --recurse-submodules git@github.com:FPGA-Research/heichips25-tapeout.git
>```
> or initialize the submodules if you cloned the repo without them:
>
>```console
> git submodule update --init --recursive .
>```



To clone the compatible PDK version, simply run `make clone-pdk`.

In the next step, install LibreLane by following the Nix-based installation instructions: https://librelane.readthedocs.io/en/latest/installation/nix_installation/index.html

Afterwards you can enable a Nix shell by running `nix-shell`.

## Implementing the Tiles

```
cd ip/tile_library/; nix develop --command make all
```

## Implementing the Fabric

```
cd ip/fabric/; nix develop --command make fabric
```

### Running LibreLane

To build the chip with LibreLane:

```console
make librelane
```

To view the design in OpenROAD:

```console
make librelane-openroad
```

Or to view it in KLayout:

```console
make librelane-klayout
```

To render an image of the chip:

```
make render-image
```

And with this the chip is ready for tapeout. 

### Building the Bitstreams

To build the bitstream, install the fasm Python package:

```
pip3 install fasm
```

And run the following:

```
cd ip/fabric/user_designs/; nix shell nixpkgs#{yosys,nextpnr} --command make build_all
```

### Running Chip-Top Level Simulation

The cocotb testbench is located under `tb/heichips25_top/heichips25_top_tb.py`.

To run all chip-top level simulations, simply run:

```
make sim
```

You can run the gate-level tests after the chip has been implemented:

```
make sim-gl
```

## License

The chip is licensed under the Apache 2.0 license. This license may *not* apply to the remainder of the repository.

## Acknowledgements

The chip was designed by Leo Moser for the HeiChips Summer School 2025.

Thanks to [Heidelberg University](https://www.uni-heidelberg.de/en), [BMFTR](https://www.bmftr.bund.de/) and [Chipdesign Germany](https://www.chipdesign-germany.de/en/) for the finanical support enabling the tapeout of the chip.
