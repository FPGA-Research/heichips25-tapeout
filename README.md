# HeiChips 2025 Tapeout

![heichips25.jpg](img/heichips25.jpg)

This repository contains the chip for the HeiChips Summer School 2025. It contains several designs during the Hackathon all connected to a common eFPGA fabric.
Thanks to FABulous, the user bitstream for the FPGA can be generated using the upstream yosys and nextpnr toolchain.

The chip was designed with open source EDA tools and the [IHP Open Source PDK](https://github.com/IHP-GmbH/IHP-Open-PDK).

<p align="center">
  <a href="img/heichips.png">
    <img src="img/heichips_small.png" alt="chip layout" width=35%>
  </a>
</p>

## Feature Overview

Several user submitted designs from the TODO

- [FABulous](https://github.com/FPGA-Research/FABulous) eFPGA
  - 32x I/Os
  - 256x LUT4 + FF
    - w. carry chain
  - 1x SRAM
    - 32 bit-wide, 4kB deep
    - individual bit-enable
  - 1x global clock network

The FPGA can configure itself from an SPI Flash from any of 16 different slots, or receive the bitsream via SPI. The CPU can also trigger a reconfiguration or provide the bitstream directly.

## Building the Chip

> [!NOTE]
> The build process currently relies on specific branches of [LibreLane](https://github.com/librelane/librelane) and the [IHP Open PDK](https://github.com/IHP-GmbH/IHP-Open-PDK).

TODO

To build the chip with LibreLane:

```console
librelane --manual-pdk config.yaml
```

Note: You need to export `PDK_ROOT` and `PDK` to the path of the IHP Open PDK and the name of the PDK.

The final steps:

```
make copy-final
make extract
make edit-netlists
make lvs
make insert-logo
make create-image
make fill
make drc
make zip
```

And with this the chip is ready for tapeout. 

## License

Copyright Leo Moser

The chip is licensed under the Apache 2.0 license. This license may *not* apply to the remainder of the repository.