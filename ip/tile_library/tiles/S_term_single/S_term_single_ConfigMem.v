module S_term_single_ConfigMem
    #(
`ifdef EMULATION
        parameter [639:0] Emulate_Bitstream=640'b0,
`endif
        parameter MaxFramesPerCol=20,
        parameter FrameBitsPerRow=32,
        parameter NoConfigBits=0
    )
    (
        input [FrameBitsPerRow - 1:0] FrameData,
        input [MaxFramesPerCol - 1:0] FrameStrobe,
        output [NoConfigBits - 1:0] ConfigBits,
        output [NoConfigBits - 1:0] ConfigBits_N
    );

`ifdef EMULATION
`else

 //instantiate frame latches
`endif
endmodule