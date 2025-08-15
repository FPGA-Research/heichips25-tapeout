module E_TT_IF2
    #(
`ifdef EMULATION
        parameter [639:0] Tile_X0Y0_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y1_Emulate_Bitstream=640'b0,
`endif
        parameter MaxFramesPerCol=20,
        parameter FrameBitsPerRow=32
    )
    (
    //Tile_X0Y0_Direction.NORTH
        output  [3:0] Tile_X0Y0_N1BEG, //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
        output  [7:0] Tile_X0Y0_N2BEG, //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output  [7:0] Tile_X0Y0_N2BEGb, //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
        output  [15:0] Tile_X0Y0_N4BEG, //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
        input  [3:0] Tile_X0Y0_S1END, //Port(Name=S1END, IO=INPUT, XOffset=0, YOffset=1, WireCount=4, Side=NORTH)
        input  [7:0] Tile_X0Y0_S2MID, //Port(Name=S2MID, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input  [7:0] Tile_X0Y0_S2END, //Port(Name=S2END, IO=INPUT, XOffset=0, YOffset=1, WireCount=8, Side=NORTH)
        input  [15:0] Tile_X0Y0_S4END, //Port(Name=S4END, IO=INPUT, XOffset=0, YOffset=4, WireCount=4, Side=NORTH)
    //Tile_X0Y0_Direction.EAST
        input  [3:0] Tile_X0Y0_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input  [7:0] Tile_X0Y0_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input  [7:0] Tile_X0Y0_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input  [15:0] Tile_X0Y0_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input  [11:0] Tile_X0Y0_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output  [3:0] Tile_X0Y0_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output  [7:0] Tile_X0Y0_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output  [7:0] Tile_X0Y0_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output  [15:0] Tile_X0Y0_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output  [11:0] Tile_X0Y0_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile_X0Y1_Direction.NORTH
        input  [3:0] Tile_X0Y1_N1END, //Port(Name=N1END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=4, Side=SOUTH)
        input  [7:0] Tile_X0Y1_N2MID, //Port(Name=N2MID, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input  [7:0] Tile_X0Y1_N2END, //Port(Name=N2END, IO=INPUT, XOffset=0, YOffset=-1, WireCount=8, Side=SOUTH)
        input  [15:0] Tile_X0Y1_N4END, //Port(Name=N4END, IO=INPUT, XOffset=0, YOffset=-4, WireCount=4, Side=SOUTH)
        output  [3:0] Tile_X0Y1_S1BEG, //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
        output  [7:0] Tile_X0Y1_S2BEG, //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output  [7:0] Tile_X0Y1_S2BEGb, //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
        output  [15:0] Tile_X0Y1_S4BEG, //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    //Tile_X0Y1_Direction.EAST
        input  [3:0] Tile_X0Y1_E1END, //Port(Name=E1END, IO=INPUT, XOffset=1, YOffset=0, WireCount=4, Side=WEST)
        input  [7:0] Tile_X0Y1_E2MID, //Port(Name=E2MID, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input  [7:0] Tile_X0Y1_E2END, //Port(Name=E2END, IO=INPUT, XOffset=1, YOffset=0, WireCount=8, Side=WEST)
        input  [15:0] Tile_X0Y1_EE4END, //Port(Name=EE4END, IO=INPUT, XOffset=4, YOffset=0, WireCount=4, Side=WEST)
        input  [11:0] Tile_X0Y1_E6END, //Port(Name=E6END, IO=INPUT, XOffset=6, YOffset=0, WireCount=2, Side=WEST)
        output  [3:0] Tile_X0Y1_W1BEG, //Port(Name=W1BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=4, Side=WEST)
        output  [7:0] Tile_X0Y1_W2BEG, //Port(Name=W2BEG, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output  [7:0] Tile_X0Y1_W2BEGb, //Port(Name=W2BEGb, IO=OUTPUT, XOffset=-1, YOffset=0, WireCount=8, Side=WEST)
        output  [15:0] Tile_X0Y1_WW4BEG, //Port(Name=WW4BEG, IO=OUTPUT, XOffset=-4, YOffset=0, WireCount=4, Side=WEST)
        output  [11:0] Tile_X0Y1_W6BEG, //Port(Name=W6BEG, IO=OUTPUT, XOffset=-6, YOffset=0, WireCount=2, Side=WEST)
    //Tile IO ports from BELs
        input  UO_OUT_TT_PROJECT0,
        input  UO_OUT_TT_PROJECT1,
        input  UO_OUT_TT_PROJECT2,
        input  UO_OUT_TT_PROJECT3,
        input  UO_OUT_TT_PROJECT4,
        input  UO_OUT_TT_PROJECT5,
        input  UO_OUT_TT_PROJECT6,
        input  UO_OUT_TT_PROJECT7,
        input  UIO_OUT_TT_PROJECT0,
        input  UIO_OUT_TT_PROJECT1,
        input  UIO_OUT_TT_PROJECT2,
        input  UIO_OUT_TT_PROJECT3,
        input  UIO_OUT_TT_PROJECT4,
        input  UIO_OUT_TT_PROJECT5,
        input  UIO_OUT_TT_PROJECT6,
        input  UIO_OUT_TT_PROJECT7,
        input  UIO_OE_TT_PROJECT0,
        input  UIO_OE_TT_PROJECT1,
        input  UIO_OE_TT_PROJECT2,
        input  UIO_OE_TT_PROJECT3,
        input  UIO_OE_TT_PROJECT4,
        input  UIO_OE_TT_PROJECT5,
        input  UIO_OE_TT_PROJECT6,
        input  UIO_OE_TT_PROJECT7,
        output  UI_IN_TT_PROJECT0,
        output  UI_IN_TT_PROJECT1,
        output  UI_IN_TT_PROJECT2,
        output  UI_IN_TT_PROJECT3,
        output  UI_IN_TT_PROJECT4,
        output  UI_IN_TT_PROJECT5,
        output  UI_IN_TT_PROJECT6,
        output  UI_IN_TT_PROJECT7,
        output  UIO_IN_TT_PROJECT0,
        output  UIO_IN_TT_PROJECT1,
        output  UIO_IN_TT_PROJECT2,
        output  UIO_IN_TT_PROJECT3,
        output  UIO_IN_TT_PROJECT4,
        output  UIO_IN_TT_PROJECT5,
        output  UIO_IN_TT_PROJECT6,
        output  UIO_IN_TT_PROJECT7,
        output  ENA_TT_PROJECT,
        output  CLK_TT_PROJECT,
        output  RST_N_TT_PROJECT,
        output  [MaxFramesPerCol-1:0] Tile_X0Y0_FrameStrobe_O, //CONFIG_PORT
        input  [FrameBitsPerRow-1:0] Tile_X0Y0_FrameData, //CONFIG_PORT
        output  [FrameBitsPerRow-1:0] Tile_X0Y0_FrameData_O, //CONFIG_PORT
        input  [FrameBitsPerRow-1:0] Tile_X0Y1_FrameData, //CONFIG_PORT
        input  [MaxFramesPerCol-1:0] Tile_X0Y1_FrameStrobe, //CONFIG_PORT
        output  [FrameBitsPerRow-1:0] Tile_X0Y1_FrameData_O, //CONFIG_PORT
        output  Tile_X0Y0_UserCLKo,
        input  Tile_X0Y1_UserCLK
);

 //signal declarations
 //Tile_X0Y0_Direction.NORTH
    wire[3:0] Tile_X0Y0_S1BEG; //Port(Name=S1BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y0_S2BEG; //Port(Name=S2BEG, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[7:0] Tile_X0Y0_S2BEGb; //Port(Name=S2BEGb, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
    wire[15:0] Tile_X0Y0_S4BEG; //Port(Name=S4BEG, IO=OUTPUT, XOffset=0, YOffset=4, WireCount=4, Side=SOUTH)
    wire[7:0] Tile_X0Y0_top2bot_UIO_IN; //Port(Name=top2bot_UIO_IN, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=8, Side=SOUTH)
 //Tile_X0Y1_Direction.NORTH
    wire[3:0] Tile_X0Y1_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y1_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y1_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y1_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y1_bot2top_UIO_OUT; //Port(Name=bot2top_UIO_OUT, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y1_bot2top_UIO_OE; //Port(Name=bot2top_UIO_OE, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[MaxFramesPerCol-1:0] Tile_X0Y1_FrameStrobe_O;
    wire Tile_X0Y1_UserCLKo;

E_TT_IF2_top
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y0_Emulate_Bitstream)
    )
`endif
    Tile_X0Y0_E_TT_IF2_top
    (
    .N1END(Tile_X0Y1_N1BEG),
    .N2MID(Tile_X0Y1_N2BEG),
    .N2END(Tile_X0Y1_N2BEGb),
    .N4END(Tile_X0Y1_N4BEG),
    .bot2top_UIO_OUT(Tile_X0Y1_bot2top_UIO_OUT),
    .bot2top_UIO_OE(Tile_X0Y1_bot2top_UIO_OE),
    .E1END(Tile_X0Y0_E1END),
    .E2MID(Tile_X0Y0_E2MID),
    .E2END(Tile_X0Y0_E2END),
    .EE4END(Tile_X0Y0_EE4END),
    .E6END(Tile_X0Y0_E6END),
    .S1END(Tile_X0Y0_S1END),
    .S2MID(Tile_X0Y0_S2MID),
    .S2END(Tile_X0Y0_S2END),
    .S4END(Tile_X0Y0_S4END),
    .N1BEG(Tile_X0Y0_N1BEG),
    .N2BEG(Tile_X0Y0_N2BEG),
    .N2BEGb(Tile_X0Y0_N2BEGb),
    .N4BEG(Tile_X0Y0_N4BEG),
    .S1BEG(Tile_X0Y0_S1BEG),
    .S2BEG(Tile_X0Y0_S2BEG),
    .S2BEGb(Tile_X0Y0_S2BEGb),
    .S4BEG(Tile_X0Y0_S4BEG),
    .top2bot_UIO_IN(Tile_X0Y0_top2bot_UIO_IN),
    .W1BEG(Tile_X0Y0_W1BEG),
    .W2BEG(Tile_X0Y0_W2BEG),
    .W2BEGb(Tile_X0Y0_W2BEGb),
    .WW4BEG(Tile_X0Y0_WW4BEG),
    .W6BEG(Tile_X0Y0_W6BEG),
    .UserCLK(Tile_X0Y1_UserCLKo),
    .UserCLKo(Tile_X0Y0_UserCLKo),
    .FrameData(Tile_X0Y0_FrameData),
    .FrameData_O(Tile_X0Y0_FrameData_O),
    .FrameStrobe(Tile_X0Y1_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y0_FrameStrobe_O)
);

E_TT_IF2_bot
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y1_Emulate_Bitstream)
    )
`endif
    Tile_X0Y1_E_TT_IF2_bot
    (
    .N1END(Tile_X0Y1_N1END),
    .N2MID(Tile_X0Y1_N2MID),
    .N2END(Tile_X0Y1_N2END),
    .N4END(Tile_X0Y1_N4END),
    .E1END(Tile_X0Y1_E1END),
    .E2MID(Tile_X0Y1_E2MID),
    .E2END(Tile_X0Y1_E2END),
    .EE4END(Tile_X0Y1_EE4END),
    .E6END(Tile_X0Y1_E6END),
    .S1END(Tile_X0Y0_S1BEG),
    .S2MID(Tile_X0Y0_S2BEG),
    .S2END(Tile_X0Y0_S2BEGb),
    .S4END(Tile_X0Y0_S4BEG),
    .top2bot_UIO_IN(Tile_X0Y0_top2bot_UIO_IN),
    .N1BEG(Tile_X0Y1_N1BEG),
    .N2BEG(Tile_X0Y1_N2BEG),
    .N2BEGb(Tile_X0Y1_N2BEGb),
    .N4BEG(Tile_X0Y1_N4BEG),
    .bot2top_UIO_OUT(Tile_X0Y1_bot2top_UIO_OUT),
    .bot2top_UIO_OE(Tile_X0Y1_bot2top_UIO_OE),
    .S1BEG(Tile_X0Y1_S1BEG),
    .S2BEG(Tile_X0Y1_S2BEG),
    .S2BEGb(Tile_X0Y1_S2BEGb),
    .S4BEG(Tile_X0Y1_S4BEG),
    .W1BEG(Tile_X0Y1_W1BEG),
    .W2BEG(Tile_X0Y1_W2BEG),
    .W2BEGb(Tile_X0Y1_W2BEGb),
    .WW4BEG(Tile_X0Y1_WW4BEG),
    .W6BEG(Tile_X0Y1_W6BEG),
    .UO_OUT_TT_PROJECT0(UO_OUT_TT_PROJECT0),
    .UO_OUT_TT_PROJECT1(UO_OUT_TT_PROJECT1),
    .UO_OUT_TT_PROJECT2(UO_OUT_TT_PROJECT2),
    .UO_OUT_TT_PROJECT3(UO_OUT_TT_PROJECT3),
    .UO_OUT_TT_PROJECT4(UO_OUT_TT_PROJECT4),
    .UO_OUT_TT_PROJECT5(UO_OUT_TT_PROJECT5),
    .UO_OUT_TT_PROJECT6(UO_OUT_TT_PROJECT6),
    .UO_OUT_TT_PROJECT7(UO_OUT_TT_PROJECT7),
    .UIO_OUT_TT_PROJECT0(UIO_OUT_TT_PROJECT0),
    .UIO_OUT_TT_PROJECT1(UIO_OUT_TT_PROJECT1),
    .UIO_OUT_TT_PROJECT2(UIO_OUT_TT_PROJECT2),
    .UIO_OUT_TT_PROJECT3(UIO_OUT_TT_PROJECT3),
    .UIO_OUT_TT_PROJECT4(UIO_OUT_TT_PROJECT4),
    .UIO_OUT_TT_PROJECT5(UIO_OUT_TT_PROJECT5),
    .UIO_OUT_TT_PROJECT6(UIO_OUT_TT_PROJECT6),
    .UIO_OUT_TT_PROJECT7(UIO_OUT_TT_PROJECT7),
    .UIO_OE_TT_PROJECT0(UIO_OE_TT_PROJECT0),
    .UIO_OE_TT_PROJECT1(UIO_OE_TT_PROJECT1),
    .UIO_OE_TT_PROJECT2(UIO_OE_TT_PROJECT2),
    .UIO_OE_TT_PROJECT3(UIO_OE_TT_PROJECT3),
    .UIO_OE_TT_PROJECT4(UIO_OE_TT_PROJECT4),
    .UIO_OE_TT_PROJECT5(UIO_OE_TT_PROJECT5),
    .UIO_OE_TT_PROJECT6(UIO_OE_TT_PROJECT6),
    .UIO_OE_TT_PROJECT7(UIO_OE_TT_PROJECT7),
    .UI_IN_TT_PROJECT0(UI_IN_TT_PROJECT0),
    .UI_IN_TT_PROJECT1(UI_IN_TT_PROJECT1),
    .UI_IN_TT_PROJECT2(UI_IN_TT_PROJECT2),
    .UI_IN_TT_PROJECT3(UI_IN_TT_PROJECT3),
    .UI_IN_TT_PROJECT4(UI_IN_TT_PROJECT4),
    .UI_IN_TT_PROJECT5(UI_IN_TT_PROJECT5),
    .UI_IN_TT_PROJECT6(UI_IN_TT_PROJECT6),
    .UI_IN_TT_PROJECT7(UI_IN_TT_PROJECT7),
    .UIO_IN_TT_PROJECT0(UIO_IN_TT_PROJECT0),
    .UIO_IN_TT_PROJECT1(UIO_IN_TT_PROJECT1),
    .UIO_IN_TT_PROJECT2(UIO_IN_TT_PROJECT2),
    .UIO_IN_TT_PROJECT3(UIO_IN_TT_PROJECT3),
    .UIO_IN_TT_PROJECT4(UIO_IN_TT_PROJECT4),
    .UIO_IN_TT_PROJECT5(UIO_IN_TT_PROJECT5),
    .UIO_IN_TT_PROJECT6(UIO_IN_TT_PROJECT6),
    .UIO_IN_TT_PROJECT7(UIO_IN_TT_PROJECT7),
    .ENA_TT_PROJECT(ENA_TT_PROJECT),
    .CLK_TT_PROJECT(CLK_TT_PROJECT),
    .RST_N_TT_PROJECT(RST_N_TT_PROJECT),
    .UserCLK(Tile_X0Y1_UserCLK),
    .UserCLKo(Tile_X0Y1_UserCLKo),
    .FrameData(Tile_X0Y1_FrameData),
    .FrameData_O(Tile_X0Y1_FrameData_O),
    .FrameStrobe(Tile_X0Y1_FrameStrobe),
    .FrameStrobe_O(Tile_X0Y1_FrameStrobe_O)
);

endmodule