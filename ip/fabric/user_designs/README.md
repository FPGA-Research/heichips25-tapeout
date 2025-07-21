## User Designs

| Name      | Description |
|-----------|-------------|
| `all_zeros` | all outputs set to zero |
| `all_ones`  | all outputs set to one |
| `counter`   | 32-bit counter |
| `passthrough` | inputs connected to outputs |
| `sram` | all SRAMs muxed together for testing |

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