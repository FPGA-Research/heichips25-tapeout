module IHP_SRAM
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
        input  DOUT_SRAM0,
        input  DOUT_SRAM1,
        input  DOUT_SRAM2,
        input  DOUT_SRAM3,
        input  DOUT_SRAM4,
        input  DOUT_SRAM5,
        input  DOUT_SRAM6,
        input  DOUT_SRAM7,
        input  DOUT_SRAM8,
        input  DOUT_SRAM9,
        input  DOUT_SRAM10,
        input  DOUT_SRAM11,
        input  DOUT_SRAM12,
        input  DOUT_SRAM13,
        input  DOUT_SRAM14,
        input  DOUT_SRAM15,
        input  DOUT_SRAM16,
        input  DOUT_SRAM17,
        input  DOUT_SRAM18,
        input  DOUT_SRAM19,
        input  DOUT_SRAM20,
        input  DOUT_SRAM21,
        input  DOUT_SRAM22,
        input  DOUT_SRAM23,
        input  DOUT_SRAM24,
        input  DOUT_SRAM25,
        input  DOUT_SRAM26,
        input  DOUT_SRAM27,
        input  DOUT_SRAM28,
        input  DOUT_SRAM29,
        input  DOUT_SRAM30,
        input  DOUT_SRAM31,
        input  CONFIGURED_top,
        output  ADDR_SRAM0,
        output  ADDR_SRAM1,
        output  ADDR_SRAM2,
        output  ADDR_SRAM3,
        output  ADDR_SRAM4,
        output  ADDR_SRAM5,
        output  ADDR_SRAM6,
        output  ADDR_SRAM7,
        output  ADDR_SRAM8,
        output  ADDR_SRAM9,
        output  DIN_SRAM0,
        output  DIN_SRAM1,
        output  DIN_SRAM2,
        output  DIN_SRAM3,
        output  DIN_SRAM4,
        output  DIN_SRAM5,
        output  DIN_SRAM6,
        output  DIN_SRAM7,
        output  DIN_SRAM8,
        output  DIN_SRAM9,
        output  DIN_SRAM10,
        output  DIN_SRAM11,
        output  DIN_SRAM12,
        output  DIN_SRAM13,
        output  DIN_SRAM14,
        output  DIN_SRAM15,
        output  DIN_SRAM16,
        output  DIN_SRAM17,
        output  DIN_SRAM18,
        output  DIN_SRAM19,
        output  DIN_SRAM20,
        output  DIN_SRAM21,
        output  DIN_SRAM22,
        output  DIN_SRAM23,
        output  DIN_SRAM24,
        output  DIN_SRAM25,
        output  DIN_SRAM26,
        output  DIN_SRAM27,
        output  DIN_SRAM28,
        output  DIN_SRAM29,
        output  DIN_SRAM30,
        output  DIN_SRAM31,
        output  BM_SRAM0,
        output  BM_SRAM1,
        output  BM_SRAM2,
        output  BM_SRAM3,
        output  BM_SRAM4,
        output  BM_SRAM5,
        output  BM_SRAM6,
        output  BM_SRAM7,
        output  BM_SRAM8,
        output  BM_SRAM9,
        output  BM_SRAM10,
        output  BM_SRAM11,
        output  BM_SRAM12,
        output  BM_SRAM13,
        output  BM_SRAM14,
        output  BM_SRAM15,
        output  BM_SRAM16,
        output  BM_SRAM17,
        output  BM_SRAM18,
        output  BM_SRAM19,
        output  BM_SRAM20,
        output  BM_SRAM21,
        output  BM_SRAM22,
        output  BM_SRAM23,
        output  BM_SRAM24,
        output  BM_SRAM25,
        output  BM_SRAM26,
        output  BM_SRAM27,
        output  BM_SRAM28,
        output  BM_SRAM29,
        output  BM_SRAM30,
        output  BM_SRAM31,
        output  WEN_SRAM,
        output  MEN_SRAM,
        output  REN_SRAM,
        output  CLK_SRAM,
        output  TIE_HIGH_SRAM,
        output  TIE_LOW_SRAM,
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
    wire[15:0] Tile_X0Y0_top2bot_DIN; //Port(Name=top2bot_DIN, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=16, Side=SOUTH)
    wire[15:0] Tile_X0Y0_top2bot_BM; //Port(Name=top2bot_BM, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=16, Side=SOUTH)
    wire[4:0] Tile_X0Y0_top2bot_ADDR; //Port(Name=top2bot_ADDR, IO=OUTPUT, XOffset=0, YOffset=1, WireCount=5, Side=SOUTH)
 //Tile_X0Y1_Direction.NORTH
    wire[3:0] Tile_X0Y1_N1BEG; //Port(Name=N1BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=4, Side=NORTH)
    wire[7:0] Tile_X0Y1_N2BEG; //Port(Name=N2BEG, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[7:0] Tile_X0Y1_N2BEGb; //Port(Name=N2BEGb, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=8, Side=NORTH)
    wire[15:0] Tile_X0Y1_N4BEG; //Port(Name=N4BEG, IO=OUTPUT, XOffset=0, YOffset=-4, WireCount=4, Side=NORTH)
    wire[15:0] Tile_X0Y1_bot2top_DOUT; //Port(Name=bot2top_DOUT, IO=OUTPUT, XOffset=0, YOffset=-1, WireCount=16, Side=NORTH)
    wire[MaxFramesPerCol-1:0] Tile_X0Y1_FrameStrobe_O;
    wire Tile_X0Y1_UserCLKo;

IHP_SRAM_top
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y0_Emulate_Bitstream)
    )
`endif
    Tile_X0Y0_IHP_SRAM_top
    (
    .N1END(Tile_X0Y1_N1BEG),
    .N2MID(Tile_X0Y1_N2BEG),
    .N2END(Tile_X0Y1_N2BEGb),
    .N4END(Tile_X0Y1_N4BEG),
    .bot2top_DOUT(Tile_X0Y1_bot2top_DOUT),
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
    .top2bot_DIN(Tile_X0Y0_top2bot_DIN),
    .top2bot_BM(Tile_X0Y0_top2bot_BM),
    .top2bot_ADDR(Tile_X0Y0_top2bot_ADDR),
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

IHP_SRAM_bot
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y1_Emulate_Bitstream)
    )
`endif
    Tile_X0Y1_IHP_SRAM_bot
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
    .top2bot_DIN(Tile_X0Y0_top2bot_DIN),
    .top2bot_BM(Tile_X0Y0_top2bot_BM),
    .top2bot_ADDR(Tile_X0Y0_top2bot_ADDR),
    .N1BEG(Tile_X0Y1_N1BEG),
    .N2BEG(Tile_X0Y1_N2BEG),
    .N2BEGb(Tile_X0Y1_N2BEGb),
    .N4BEG(Tile_X0Y1_N4BEG),
    .bot2top_DOUT(Tile_X0Y1_bot2top_DOUT),
    .S1BEG(Tile_X0Y1_S1BEG),
    .S2BEG(Tile_X0Y1_S2BEG),
    .S2BEGb(Tile_X0Y1_S2BEGb),
    .S4BEG(Tile_X0Y1_S4BEG),
    .W1BEG(Tile_X0Y1_W1BEG),
    .W2BEG(Tile_X0Y1_W2BEG),
    .W2BEGb(Tile_X0Y1_W2BEGb),
    .WW4BEG(Tile_X0Y1_WW4BEG),
    .W6BEG(Tile_X0Y1_W6BEG),
    .DOUT_SRAM0(DOUT_SRAM0),
    .DOUT_SRAM1(DOUT_SRAM1),
    .DOUT_SRAM2(DOUT_SRAM2),
    .DOUT_SRAM3(DOUT_SRAM3),
    .DOUT_SRAM4(DOUT_SRAM4),
    .DOUT_SRAM5(DOUT_SRAM5),
    .DOUT_SRAM6(DOUT_SRAM6),
    .DOUT_SRAM7(DOUT_SRAM7),
    .DOUT_SRAM8(DOUT_SRAM8),
    .DOUT_SRAM9(DOUT_SRAM9),
    .DOUT_SRAM10(DOUT_SRAM10),
    .DOUT_SRAM11(DOUT_SRAM11),
    .DOUT_SRAM12(DOUT_SRAM12),
    .DOUT_SRAM13(DOUT_SRAM13),
    .DOUT_SRAM14(DOUT_SRAM14),
    .DOUT_SRAM15(DOUT_SRAM15),
    .DOUT_SRAM16(DOUT_SRAM16),
    .DOUT_SRAM17(DOUT_SRAM17),
    .DOUT_SRAM18(DOUT_SRAM18),
    .DOUT_SRAM19(DOUT_SRAM19),
    .DOUT_SRAM20(DOUT_SRAM20),
    .DOUT_SRAM21(DOUT_SRAM21),
    .DOUT_SRAM22(DOUT_SRAM22),
    .DOUT_SRAM23(DOUT_SRAM23),
    .DOUT_SRAM24(DOUT_SRAM24),
    .DOUT_SRAM25(DOUT_SRAM25),
    .DOUT_SRAM26(DOUT_SRAM26),
    .DOUT_SRAM27(DOUT_SRAM27),
    .DOUT_SRAM28(DOUT_SRAM28),
    .DOUT_SRAM29(DOUT_SRAM29),
    .DOUT_SRAM30(DOUT_SRAM30),
    .DOUT_SRAM31(DOUT_SRAM31),
    .CONFIGURED_top(CONFIGURED_top),
    .ADDR_SRAM0(ADDR_SRAM0),
    .ADDR_SRAM1(ADDR_SRAM1),
    .ADDR_SRAM2(ADDR_SRAM2),
    .ADDR_SRAM3(ADDR_SRAM3),
    .ADDR_SRAM4(ADDR_SRAM4),
    .ADDR_SRAM5(ADDR_SRAM5),
    .ADDR_SRAM6(ADDR_SRAM6),
    .ADDR_SRAM7(ADDR_SRAM7),
    .ADDR_SRAM8(ADDR_SRAM8),
    .ADDR_SRAM9(ADDR_SRAM9),
    .DIN_SRAM0(DIN_SRAM0),
    .DIN_SRAM1(DIN_SRAM1),
    .DIN_SRAM2(DIN_SRAM2),
    .DIN_SRAM3(DIN_SRAM3),
    .DIN_SRAM4(DIN_SRAM4),
    .DIN_SRAM5(DIN_SRAM5),
    .DIN_SRAM6(DIN_SRAM6),
    .DIN_SRAM7(DIN_SRAM7),
    .DIN_SRAM8(DIN_SRAM8),
    .DIN_SRAM9(DIN_SRAM9),
    .DIN_SRAM10(DIN_SRAM10),
    .DIN_SRAM11(DIN_SRAM11),
    .DIN_SRAM12(DIN_SRAM12),
    .DIN_SRAM13(DIN_SRAM13),
    .DIN_SRAM14(DIN_SRAM14),
    .DIN_SRAM15(DIN_SRAM15),
    .DIN_SRAM16(DIN_SRAM16),
    .DIN_SRAM17(DIN_SRAM17),
    .DIN_SRAM18(DIN_SRAM18),
    .DIN_SRAM19(DIN_SRAM19),
    .DIN_SRAM20(DIN_SRAM20),
    .DIN_SRAM21(DIN_SRAM21),
    .DIN_SRAM22(DIN_SRAM22),
    .DIN_SRAM23(DIN_SRAM23),
    .DIN_SRAM24(DIN_SRAM24),
    .DIN_SRAM25(DIN_SRAM25),
    .DIN_SRAM26(DIN_SRAM26),
    .DIN_SRAM27(DIN_SRAM27),
    .DIN_SRAM28(DIN_SRAM28),
    .DIN_SRAM29(DIN_SRAM29),
    .DIN_SRAM30(DIN_SRAM30),
    .DIN_SRAM31(DIN_SRAM31),
    .BM_SRAM0(BM_SRAM0),
    .BM_SRAM1(BM_SRAM1),
    .BM_SRAM2(BM_SRAM2),
    .BM_SRAM3(BM_SRAM3),
    .BM_SRAM4(BM_SRAM4),
    .BM_SRAM5(BM_SRAM5),
    .BM_SRAM6(BM_SRAM6),
    .BM_SRAM7(BM_SRAM7),
    .BM_SRAM8(BM_SRAM8),
    .BM_SRAM9(BM_SRAM9),
    .BM_SRAM10(BM_SRAM10),
    .BM_SRAM11(BM_SRAM11),
    .BM_SRAM12(BM_SRAM12),
    .BM_SRAM13(BM_SRAM13),
    .BM_SRAM14(BM_SRAM14),
    .BM_SRAM15(BM_SRAM15),
    .BM_SRAM16(BM_SRAM16),
    .BM_SRAM17(BM_SRAM17),
    .BM_SRAM18(BM_SRAM18),
    .BM_SRAM19(BM_SRAM19),
    .BM_SRAM20(BM_SRAM20),
    .BM_SRAM21(BM_SRAM21),
    .BM_SRAM22(BM_SRAM22),
    .BM_SRAM23(BM_SRAM23),
    .BM_SRAM24(BM_SRAM24),
    .BM_SRAM25(BM_SRAM25),
    .BM_SRAM26(BM_SRAM26),
    .BM_SRAM27(BM_SRAM27),
    .BM_SRAM28(BM_SRAM28),
    .BM_SRAM29(BM_SRAM29),
    .BM_SRAM30(BM_SRAM30),
    .BM_SRAM31(BM_SRAM31),
    .WEN_SRAM(WEN_SRAM),
    .MEN_SRAM(MEN_SRAM),
    .REN_SRAM(REN_SRAM),
    .CLK_SRAM(CLK_SRAM),
    .TIE_HIGH_SRAM(TIE_HIGH_SRAM),
    .TIE_LOW_SRAM(TIE_LOW_SRAM),
    .UserCLK(Tile_X0Y1_UserCLK),
    .UserCLKo(Tile_X0Y1_UserCLKo),
    .FrameData(Tile_X0Y1_FrameData),
    .FrameData_O(Tile_X0Y1_FrameData_O),
    .FrameStrobe(Tile_X0Y1_FrameStrobe),
    .FrameStrobe_O(Tile_X0Y1_FrameStrobe_O)
);

endmodule