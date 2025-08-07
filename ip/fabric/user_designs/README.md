## User Designs

| Name      | Description |
|-----------|-------------|
| `all_zeros` | all outputs set to zero |
| `all_ones`  | all outputs set to one |
| `counter`   | 32-bit counter |
| `counter`   | 32-bit counter for top-level testing |
| `passthrough` | inputs connected to outputs |
| `sram` | `IHP_SRAM_1024x32` connected to the I/Os |
| `tt_project` | `TT_PROJECT` connected to the I/Os  |
| `tt_project_to_sram` | `TT_PROJECT` connected to `IHP_SRAM_1024x32` and I/Os |

To build individual user designs, go into one of the directories and run the commands:

```
Commands:
 synth           ... Synthesize the user design
 pnr             ... Run Place and Route
 bitstream       ... Generate the bitstream
 clean           ... Delete all generated files
 help            ... Show this help message
```

To build all of them, enable a nix shell:

```
nix shell nixpkgs#{yosys,nextpnr}
```

And run:

```
make build_all
```

To delete all generated files, run:

```
make clean_all
```

**Note:** To generate the bitstreams you need to `pip3 install fasm`.
