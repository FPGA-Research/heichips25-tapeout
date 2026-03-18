# FABulous Tiles

This repository hosts tiles for the [FABulous](https://github.com/FPGA-Research/FABulous) framework and configuration files in order to harden them with the [FABulous LibreLane plugin](https://github.com/mole99/librelane_plugin_fabulous).

Enable the plugin and harden all tiles using `make` or harden individual tiles using e.g. `make tiles/LUT4AB`.
You can also run multiple tiles in parallel using `make -j <NUMBER_OF_PARALLEL_JOBS>`.

> [!IMPORTANT]
> For documentation about the primitives of the tiles, please see the [README](docs/README.md) in the docs.

## Custom Tiles

The custom tiles created for special use.

| Name           | Description |
|----------------|-------------|
| N_IO4          | 4xIO tile for the north side |
| S_IO4          | 4xIO tile for the south side |
| E_TT_IF        | Tiny Tapeout interface, east side |
| E_TT_IF2       | Tiny Tapeout interface, east side, 2 tiles high |
| W_TT_IF        | Tiny Tapeout interface, west side |
| W_TT_IF2       | Tiny Tapeout interface, west side, 2 tiles high |
| SE_term        | corner termination tile |
| NW_term        | corner termination tile |
| SW_term        | corner termination tile |
| NE_term        | corner termination tile |
| IHP_SRAM       | 1024x32 single ported SRAM |

## Default Tiles

Some of the default tiles provided by FABulous.

| Name           | Description |
|----------------|-------------|
| LUT4AB         | Tile with 8x LUT4 and FF |
| N_term_single  | Termination tile for LUT4AB  |
| S_term_single  | Termination tile for LUT4AB  |

## License

FABulous Tiles is licensed under the Apache 2.0 license.
