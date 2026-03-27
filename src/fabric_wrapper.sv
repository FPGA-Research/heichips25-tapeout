`default_nettype none

module fabric_wrapper #(
    parameter FrameBitsPerRow = 32,
    parameter MaxFramesPerCol = 20,
    
    parameter NumColumns = 6,
    parameter NumRows = 11,
    
    parameter FABRIC_NUM_IO_NORTH = 16,
    parameter FABRIC_NUM_IO_SOUTH = 16
)(

    // Configuration
    input  logic [(FrameBitsPerRow*NumRows)-1:0]    FrameData_i,
    input  logic [(MaxFramesPerCol*NumColumns)-1:0] FrameStrobe_i,

    // Fabric is configured
    input                                configured_i,
    input                                sys_reset_i,

    // I/Os North
    input  [FABRIC_NUM_IO_NORTH-1:0]      io_north_in_i,
    output [FABRIC_NUM_IO_NORTH-1:0]      io_north_out_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      io_north_oe_o,

    // I/Os South
    input  [FABRIC_NUM_IO_SOUTH-1:0]      io_south_in_i,
    output [FABRIC_NUM_IO_SOUTH-1:0]      io_south_out_o,
    output [FABRIC_NUM_IO_SOUTH-1:0]      io_south_oe_o,

    // User I/O
    output usb_dn_en_o,
    input  usb_dn_rx_i,
    output usb_dn_tx_o,
    output usb_dp_en_o,
    input  usb_dp_rx_i,
    output usb_dp_tx_o,
    output usb_dp_up_o,
    
    output tmds_b,
    output tmds_g,
    output tmds_r,
    output tmds_clk,
    
    inout icelab_analog_pin0,
    inout icelab_analog_pin1,
    inout icelab_analog_pin2,
    inout icelab_analog_pin3,
    
    inout internal_analog_pin0,
    inout internal_analog_pin1,
    inout internal_analog_pin2,
    
    inout pudding_i_in,
    inout pudding_i_out,
    
    output ethernet_dp,
    output ethernet_dn
);

    // TT_PROJECT 0 (X0Y2)
    logic [7:0] tt_project_0_ui_in;
    logic [7:0] tt_project_0_uo_out;
    logic [7:0] tt_project_0_uio_in;
    logic [7:0] tt_project_0_uio_out;
    logic [7:0] tt_project_0_uio_oe;
    logic  tt_project_0_ena;
    logic  tt_project_0_clk;
    logic  tt_project_0_rst_n;

    // TT_PROJECT 1 (X0Y3)
    logic [7:0] tt_project_1_ui_in;
    logic [7:0] tt_project_1_uo_out;
    logic [7:0] tt_project_1_uio_in;
    logic [7:0] tt_project_1_uio_out;
    logic [7:0] tt_project_1_uio_oe;
    logic  tt_project_1_ena;
    logic  tt_project_1_clk;
    logic  tt_project_1_rst_n;

    // TT_PROJECT 2 (X0Y4)
    logic [7:0] tt_project_2_ui_in;
    logic [7:0] tt_project_2_uo_out;
    logic [7:0] tt_project_2_uio_in;
    logic [7:0] tt_project_2_uio_out;
    logic [7:0] tt_project_2_uio_oe;
    logic  tt_project_2_ena;
    logic  tt_project_2_clk;
    logic  tt_project_2_rst_n;

    // TT_PROJECT 3 (X0Y5)
    logic [7:0] tt_project_3_ui_in;
    logic [7:0] tt_project_3_uo_out;
    logic [7:0] tt_project_3_uio_in;
    logic [7:0] tt_project_3_uio_out;
    logic [7:0] tt_project_3_uio_oe;
    logic  tt_project_3_ena;
    logic  tt_project_3_clk;
    logic  tt_project_3_rst_n;

    // TT_PROJECT 4 (X0Y6)
    logic [7:0] tt_project_4_ui_in;
    logic [7:0] tt_project_4_uo_out;
    logic [7:0] tt_project_4_uio_in;
    logic [7:0] tt_project_4_uio_out;
    logic [7:0] tt_project_4_uio_oe;
    logic  tt_project_4_ena;
    logic  tt_project_4_clk;
    logic  tt_project_4_rst_n;

    // TT_PROJECT 5 (X0Y7)
    logic [7:0] tt_project_5_ui_in;
    logic [7:0] tt_project_5_uo_out;
    logic [7:0] tt_project_5_uio_in;
    logic [7:0] tt_project_5_uio_out;
    logic [7:0] tt_project_5_uio_oe;
    logic  tt_project_5_ena;
    logic  tt_project_5_clk;
    logic  tt_project_5_rst_n;

    // TT_PROJECT 6 (X0Y9)
    logic [7:0] tt_project_6_ui_in;
    logic [7:0] tt_project_6_uo_out;
    logic [7:0] tt_project_6_uio_in;
    logic [7:0] tt_project_6_uio_out;
    logic [7:0] tt_project_6_uio_oe;
    logic  tt_project_6_ena;
    logic  tt_project_6_clk;
    logic  tt_project_6_rst_n;

    // TT_PROJECT 7 (X5Y1)
    logic [7:0] tt_project_7_ui_in;
    logic [7:0] tt_project_7_uo_out;
    logic [7:0] tt_project_7_uio_in;
    logic [7:0] tt_project_7_uio_out;
    logic [7:0] tt_project_7_uio_oe;
    logic  tt_project_7_ena;
    logic  tt_project_7_clk;
    logic  tt_project_7_rst_n;

    // TT_PROJECT 8 (X5Y2)
    logic [7:0] tt_project_8_ui_in;
    logic [7:0] tt_project_8_uo_out;
    logic [7:0] tt_project_8_uio_in;
    logic [7:0] tt_project_8_uio_out;
    logic [7:0] tt_project_8_uio_oe;
    logic  tt_project_8_ena;
    logic  tt_project_8_clk;
    logic  tt_project_8_rst_n;

    // TT_PROJECT 9 (X5Y3)
    logic [7:0] tt_project_9_ui_in;
    logic [7:0] tt_project_9_uo_out;
    logic [7:0] tt_project_9_uio_in;
    logic [7:0] tt_project_9_uio_out;
    logic [7:0] tt_project_9_uio_oe;
    logic  tt_project_9_ena;
    logic  tt_project_9_clk;
    logic  tt_project_9_rst_n;

    // TT_PROJECT 10 (X5Y4)
    logic [7:0] tt_project_10_ui_in;
    logic [7:0] tt_project_10_uo_out;
    logic [7:0] tt_project_10_uio_in;
    logic [7:0] tt_project_10_uio_out;
    logic [7:0] tt_project_10_uio_oe;
    logic  tt_project_10_ena;
    logic  tt_project_10_clk;
    logic  tt_project_10_rst_n;

    // TT_PROJECT 11 (X5Y7)
    logic [7:0] tt_project_11_ui_in;
    logic [7:0] tt_project_11_uo_out;
    logic [7:0] tt_project_11_uio_in;
    logic [7:0] tt_project_11_uio_out;
    logic [7:0] tt_project_11_uio_oe;
    logic  tt_project_11_ena;
    logic  tt_project_11_clk;
    logic  tt_project_11_rst_n;

    // TT_PROJECT 12 (X5Y8)
    logic [7:0] tt_project_12_ui_in;
    logic [7:0] tt_project_12_uo_out;
    logic [7:0] tt_project_12_uio_in;
    logic [7:0] tt_project_12_uio_out;
    logic [7:0] tt_project_12_uio_oe;
    logic  tt_project_12_ena;
    logic  tt_project_12_clk;
    logic  tt_project_12_rst_n;

    // TT_PROJECT 13 (X5Y9)
    logic [7:0] tt_project_13_ui_in;
    logic [7:0] tt_project_13_uo_out;
    logic [7:0] tt_project_13_uio_in;
    logic [7:0] tt_project_13_uio_out;
    logic [7:0] tt_project_13_uio_oe;
    logic  tt_project_13_ena;
    logic  tt_project_13_clk;
    logic  tt_project_13_rst_n;

    // SRAM 0
    logic [31:0] fabric_sram0_dout_i;
    logic [9 :0] fabric_sram0_addr_o;
    logic [31:0] fabric_sram0_bm_o;
    logic [31:0] fabric_sram0_din_o;
    logic        fabric_sram0_wen_o;
    logic        fabric_sram0_men_o;
    logic        fabric_sram0_ren_o;
    logic        fabric_sram0_clk_o;
    logic        fabric_sram0_tie_high_o;
    logic        fabric_sram0_tie_low_o;

    classic_fabric_heichips25
    //#(
    //    .MaxFramesPerCol(MaxFramesPerCol),
    //    .FrameBitsPerRow(FrameBitsPerRow)
    //)
    classic_fabric_heichips25
    (
        .FrameData      (FrameData_i),
        .FrameStrobe    (FrameStrobe_i),

        // North I/Os
        .Tile_X1Y0_A_OUT_top(io_north_in_i[0]),
        .Tile_X1Y0_A_IN_top(io_north_out_o[0]),
        .Tile_X1Y0_A_EN_top(io_north_oe_o[0]),

        .Tile_X1Y0_B_OUT_top(io_north_in_i[1]),
        .Tile_X1Y0_B_IN_top(io_north_out_o[1]),
        .Tile_X1Y0_B_EN_top(io_north_oe_o[1]),

        .Tile_X1Y0_C_OUT_top(io_north_in_i[2]),
        .Tile_X1Y0_C_IN_top(io_north_out_o[2]),
        .Tile_X1Y0_C_EN_top(io_north_oe_o[2]),

        .Tile_X1Y0_D_OUT_top(io_north_in_i[3]),
        .Tile_X1Y0_D_IN_top(io_north_out_o[3]),
        .Tile_X1Y0_D_EN_top(io_north_oe_o[3]),

        .Tile_X2Y0_A_OUT_top(io_north_in_i[4]),
        .Tile_X2Y0_A_IN_top(io_north_out_o[4]),
        .Tile_X2Y0_A_EN_top(io_north_oe_o[4]),

        .Tile_X2Y0_B_OUT_top(io_north_in_i[5]),
        .Tile_X2Y0_B_IN_top(io_north_out_o[5]),
        .Tile_X2Y0_B_EN_top(io_north_oe_o[5]),

        .Tile_X2Y0_C_OUT_top(io_north_in_i[6]),
        .Tile_X2Y0_C_IN_top(io_north_out_o[6]),
        .Tile_X2Y0_C_EN_top(io_north_oe_o[6]),

        .Tile_X2Y0_D_OUT_top(io_north_in_i[7]),
        .Tile_X2Y0_D_IN_top(io_north_out_o[7]),
        .Tile_X2Y0_D_EN_top(io_north_oe_o[7]),

        .Tile_X3Y0_A_OUT_top(io_north_in_i[8]),
        .Tile_X3Y0_A_IN_top(io_north_out_o[8]),
        .Tile_X3Y0_A_EN_top(io_north_oe_o[8]),

        .Tile_X3Y0_B_OUT_top(io_north_in_i[9]),
        .Tile_X3Y0_B_IN_top(io_north_out_o[9]),
        .Tile_X3Y0_B_EN_top(io_north_oe_o[9]),

        .Tile_X3Y0_C_OUT_top(io_north_in_i[10]),
        .Tile_X3Y0_C_IN_top(io_north_out_o[10]),
        .Tile_X3Y0_C_EN_top(io_north_oe_o[10]),

        .Tile_X3Y0_D_OUT_top(io_north_in_i[11]),
        .Tile_X3Y0_D_IN_top(io_north_out_o[11]),
        .Tile_X3Y0_D_EN_top(io_north_oe_o[11]),

        .Tile_X4Y0_A_OUT_top(io_north_in_i[12]),
        .Tile_X4Y0_A_IN_top(io_north_out_o[12]),
        .Tile_X4Y0_A_EN_top(io_north_oe_o[12]),

        .Tile_X4Y0_B_OUT_top(io_north_in_i[13]),
        .Tile_X4Y0_B_IN_top(io_north_out_o[13]),
        .Tile_X4Y0_B_EN_top(io_north_oe_o[13]),

        .Tile_X4Y0_C_OUT_top(io_north_in_i[14]),
        .Tile_X4Y0_C_IN_top(io_north_out_o[14]),
        .Tile_X4Y0_C_EN_top(io_north_oe_o[14]),

        .Tile_X4Y0_D_OUT_top(io_north_in_i[15]),
        .Tile_X4Y0_D_IN_top(io_north_out_o[15]),
        .Tile_X4Y0_D_EN_top(io_north_oe_o[15]),

        // South I/Os
        .Tile_X1Y10_A_OUT_top(io_south_in_i[0]),
        .Tile_X1Y10_A_IN_top(io_south_out_o[0]),
        .Tile_X1Y10_A_EN_top(io_south_oe_o[0]),

        .Tile_X1Y10_B_OUT_top(io_south_in_i[1]),
        .Tile_X1Y10_B_IN_top(io_south_out_o[1]),
        .Tile_X1Y10_B_EN_top(io_south_oe_o[1]),

        .Tile_X1Y10_C_OUT_top(io_south_in_i[2]),
        .Tile_X1Y10_C_IN_top(io_south_out_o[2]),
        .Tile_X1Y10_C_EN_top(io_south_oe_o[2]),

        .Tile_X1Y10_D_OUT_top(io_south_in_i[3]),
        .Tile_X1Y10_D_IN_top(io_south_out_o[3]),
        .Tile_X1Y10_D_EN_top(io_south_oe_o[3]),

        .Tile_X2Y10_A_OUT_top(io_south_in_i[4]),
        .Tile_X2Y10_A_IN_top(io_south_out_o[4]),
        .Tile_X2Y10_A_EN_top(io_south_oe_o[4]),

        .Tile_X2Y10_B_OUT_top(io_south_in_i[5]),
        .Tile_X2Y10_B_IN_top(io_south_out_o[5]),
        .Tile_X2Y10_B_EN_top(io_south_oe_o[5]),

        .Tile_X2Y10_C_OUT_top(io_south_in_i[6]),
        .Tile_X2Y10_C_IN_top(io_south_out_o[6]),
        .Tile_X2Y10_C_EN_top(io_south_oe_o[6]),

        .Tile_X2Y10_D_OUT_top(io_south_in_i[7]),
        .Tile_X2Y10_D_IN_top(io_south_out_o[7]),
        .Tile_X2Y10_D_EN_top(io_south_oe_o[7]),

        .Tile_X3Y10_A_OUT_top(io_south_in_i[8]),
        .Tile_X3Y10_A_IN_top(io_south_out_o[8]),
        .Tile_X3Y10_A_EN_top(io_south_oe_o[8]),

        .Tile_X3Y10_B_OUT_top(io_south_in_i[9]),
        .Tile_X3Y10_B_IN_top(io_south_out_o[9]),
        .Tile_X3Y10_B_EN_top(io_south_oe_o[9]),

        .Tile_X3Y10_C_OUT_top(io_south_in_i[10]),
        .Tile_X3Y10_C_IN_top(io_south_out_o[10]),
        .Tile_X3Y10_C_EN_top(io_south_oe_o[10]),

        .Tile_X3Y10_D_OUT_top(io_south_in_i[11]),
        .Tile_X3Y10_D_IN_top(io_south_out_o[11]),
        .Tile_X3Y10_D_EN_top(io_south_oe_o[11]),

        .Tile_X4Y10_A_OUT_top(io_south_in_i[12]),
        .Tile_X4Y10_A_IN_top(io_south_out_o[12]),
        .Tile_X4Y10_A_EN_top(io_south_oe_o[12]),

        .Tile_X4Y10_B_OUT_top(io_south_in_i[13]),
        .Tile_X4Y10_B_IN_top(io_south_out_o[13]),
        .Tile_X4Y10_B_EN_top(io_south_oe_o[13]),

        .Tile_X4Y10_C_OUT_top(io_south_in_i[14]),
        .Tile_X4Y10_C_IN_top(io_south_out_o[14]),
        .Tile_X4Y10_C_EN_top(io_south_oe_o[14]),

        .Tile_X4Y10_D_OUT_top(io_south_in_i[15]),
        .Tile_X4Y10_D_IN_top(io_south_out_o[15]),
        .Tile_X4Y10_D_EN_top(io_south_oe_o[15]),

        // SYS_RESET
        .Tile_X0Y10_SYS_RESET_RESET_top(sys_reset_i),

        // TT_PROJECT 0 (X0Y2)
        .Tile_X0Y2_UI_IN_TT_PROJECT0(tt_project_0_ui_in[0]),
        .Tile_X0Y2_UI_IN_TT_PROJECT1(tt_project_0_ui_in[1]),
        .Tile_X0Y2_UI_IN_TT_PROJECT2(tt_project_0_ui_in[2]),
        .Tile_X0Y2_UI_IN_TT_PROJECT3(tt_project_0_ui_in[3]),
        .Tile_X0Y2_UI_IN_TT_PROJECT4(tt_project_0_ui_in[4]),
        .Tile_X0Y2_UI_IN_TT_PROJECT5(tt_project_0_ui_in[5]),
        .Tile_X0Y2_UI_IN_TT_PROJECT6(tt_project_0_ui_in[6]),
        .Tile_X0Y2_UI_IN_TT_PROJECT7(tt_project_0_ui_in[7]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT0(tt_project_0_uo_out[0]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT1(tt_project_0_uo_out[1]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT2(tt_project_0_uo_out[2]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT3(tt_project_0_uo_out[3]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT4(tt_project_0_uo_out[4]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT5(tt_project_0_uo_out[5]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT6(tt_project_0_uo_out[6]),
        .Tile_X0Y2_UO_OUT_TT_PROJECT7(tt_project_0_uo_out[7]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT0(tt_project_0_uio_in[0]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT1(tt_project_0_uio_in[1]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT2(tt_project_0_uio_in[2]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT3(tt_project_0_uio_in[3]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT4(tt_project_0_uio_in[4]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT5(tt_project_0_uio_in[5]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT6(tt_project_0_uio_in[6]),
        .Tile_X0Y2_UIO_IN_TT_PROJECT7(tt_project_0_uio_in[7]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT0(tt_project_0_uio_out[0]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT1(tt_project_0_uio_out[1]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT2(tt_project_0_uio_out[2]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT3(tt_project_0_uio_out[3]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT4(tt_project_0_uio_out[4]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT5(tt_project_0_uio_out[5]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT6(tt_project_0_uio_out[6]),
        .Tile_X0Y2_UIO_OUT_TT_PROJECT7(tt_project_0_uio_out[7]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT0(tt_project_0_uio_oe[0]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT1(tt_project_0_uio_oe[1]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT2(tt_project_0_uio_oe[2]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT3(tt_project_0_uio_oe[3]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT4(tt_project_0_uio_oe[4]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT5(tt_project_0_uio_oe[5]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT6(tt_project_0_uio_oe[6]),
        .Tile_X0Y2_UIO_OE_TT_PROJECT7(tt_project_0_uio_oe[7]),
        .Tile_X0Y2_ENA_TT_PROJECT(tt_project_0_ena),
        .Tile_X0Y2_CLK_TT_PROJECT(tt_project_0_clk),
        .Tile_X0Y2_RST_N_TT_PROJECT(tt_project_0_rst_n),

        // TT_PROJECT 1 (X0Y3)
        .Tile_X0Y3_UI_IN_TT_PROJECT0(tt_project_1_ui_in[0]),
        .Tile_X0Y3_UI_IN_TT_PROJECT1(tt_project_1_ui_in[1]),
        .Tile_X0Y3_UI_IN_TT_PROJECT2(tt_project_1_ui_in[2]),
        .Tile_X0Y3_UI_IN_TT_PROJECT3(tt_project_1_ui_in[3]),
        .Tile_X0Y3_UI_IN_TT_PROJECT4(tt_project_1_ui_in[4]),
        .Tile_X0Y3_UI_IN_TT_PROJECT5(tt_project_1_ui_in[5]),
        .Tile_X0Y3_UI_IN_TT_PROJECT6(tt_project_1_ui_in[6]),
        .Tile_X0Y3_UI_IN_TT_PROJECT7(tt_project_1_ui_in[7]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT0(tt_project_1_uo_out[0]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT1(tt_project_1_uo_out[1]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT2(tt_project_1_uo_out[2]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT3(tt_project_1_uo_out[3]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT4(tt_project_1_uo_out[4]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT5(tt_project_1_uo_out[5]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT6(tt_project_1_uo_out[6]),
        .Tile_X0Y3_UO_OUT_TT_PROJECT7(tt_project_1_uo_out[7]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT0(tt_project_1_uio_in[0]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT1(tt_project_1_uio_in[1]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT2(tt_project_1_uio_in[2]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT3(tt_project_1_uio_in[3]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT4(tt_project_1_uio_in[4]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT5(tt_project_1_uio_in[5]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT6(tt_project_1_uio_in[6]),
        .Tile_X0Y3_UIO_IN_TT_PROJECT7(tt_project_1_uio_in[7]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT0(tt_project_1_uio_out[0]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT1(tt_project_1_uio_out[1]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT2(tt_project_1_uio_out[2]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT3(tt_project_1_uio_out[3]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT4(tt_project_1_uio_out[4]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT5(tt_project_1_uio_out[5]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT6(tt_project_1_uio_out[6]),
        .Tile_X0Y3_UIO_OUT_TT_PROJECT7(tt_project_1_uio_out[7]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT0(tt_project_1_uio_oe[0]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT1(tt_project_1_uio_oe[1]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT2(tt_project_1_uio_oe[2]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT3(tt_project_1_uio_oe[3]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT4(tt_project_1_uio_oe[4]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT5(tt_project_1_uio_oe[5]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT6(tt_project_1_uio_oe[6]),
        .Tile_X0Y3_UIO_OE_TT_PROJECT7(tt_project_1_uio_oe[7]),
        .Tile_X0Y3_ENA_TT_PROJECT(tt_project_1_ena),
        .Tile_X0Y3_CLK_TT_PROJECT(tt_project_1_clk),
        .Tile_X0Y3_RST_N_TT_PROJECT(tt_project_1_rst_n),

        // TT_PROJECT 2 (X0Y4)
        .Tile_X0Y4_UI_IN_TT_PROJECT0(tt_project_2_ui_in[0]),
        .Tile_X0Y4_UI_IN_TT_PROJECT1(tt_project_2_ui_in[1]),
        .Tile_X0Y4_UI_IN_TT_PROJECT2(tt_project_2_ui_in[2]),
        .Tile_X0Y4_UI_IN_TT_PROJECT3(tt_project_2_ui_in[3]),
        .Tile_X0Y4_UI_IN_TT_PROJECT4(tt_project_2_ui_in[4]),
        .Tile_X0Y4_UI_IN_TT_PROJECT5(tt_project_2_ui_in[5]),
        .Tile_X0Y4_UI_IN_TT_PROJECT6(tt_project_2_ui_in[6]),
        .Tile_X0Y4_UI_IN_TT_PROJECT7(tt_project_2_ui_in[7]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT0(tt_project_2_uo_out[0]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT1(tt_project_2_uo_out[1]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT2(tt_project_2_uo_out[2]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT3(tt_project_2_uo_out[3]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT4(tt_project_2_uo_out[4]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT5(tt_project_2_uo_out[5]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT6(tt_project_2_uo_out[6]),
        .Tile_X0Y4_UO_OUT_TT_PROJECT7(tt_project_2_uo_out[7]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT0(tt_project_2_uio_in[0]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT1(tt_project_2_uio_in[1]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT2(tt_project_2_uio_in[2]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT3(tt_project_2_uio_in[3]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT4(tt_project_2_uio_in[4]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT5(tt_project_2_uio_in[5]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT6(tt_project_2_uio_in[6]),
        .Tile_X0Y4_UIO_IN_TT_PROJECT7(tt_project_2_uio_in[7]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT0(tt_project_2_uio_out[0]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT1(tt_project_2_uio_out[1]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT2(tt_project_2_uio_out[2]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT3(tt_project_2_uio_out[3]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT4(tt_project_2_uio_out[4]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT5(tt_project_2_uio_out[5]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT6(tt_project_2_uio_out[6]),
        .Tile_X0Y4_UIO_OUT_TT_PROJECT7(tt_project_2_uio_out[7]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT0(tt_project_2_uio_oe[0]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT1(tt_project_2_uio_oe[1]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT2(tt_project_2_uio_oe[2]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT3(tt_project_2_uio_oe[3]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT4(tt_project_2_uio_oe[4]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT5(tt_project_2_uio_oe[5]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT6(tt_project_2_uio_oe[6]),
        .Tile_X0Y4_UIO_OE_TT_PROJECT7(tt_project_2_uio_oe[7]),
        .Tile_X0Y4_ENA_TT_PROJECT(tt_project_2_ena),
        .Tile_X0Y4_CLK_TT_PROJECT(tt_project_2_clk),
        .Tile_X0Y4_RST_N_TT_PROJECT(tt_project_2_rst_n),

        // TT_PROJECT 3 (X0Y5)
        .Tile_X0Y5_UI_IN_TT_PROJECT0(tt_project_3_ui_in[0]),
        .Tile_X0Y5_UI_IN_TT_PROJECT1(tt_project_3_ui_in[1]),
        .Tile_X0Y5_UI_IN_TT_PROJECT2(tt_project_3_ui_in[2]),
        .Tile_X0Y5_UI_IN_TT_PROJECT3(tt_project_3_ui_in[3]),
        .Tile_X0Y5_UI_IN_TT_PROJECT4(tt_project_3_ui_in[4]),
        .Tile_X0Y5_UI_IN_TT_PROJECT5(tt_project_3_ui_in[5]),
        .Tile_X0Y5_UI_IN_TT_PROJECT6(tt_project_3_ui_in[6]),
        .Tile_X0Y5_UI_IN_TT_PROJECT7(tt_project_3_ui_in[7]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT0(tt_project_3_uo_out[0]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT1(tt_project_3_uo_out[1]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT2(tt_project_3_uo_out[2]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT3(tt_project_3_uo_out[3]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT4(tt_project_3_uo_out[4]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT5(tt_project_3_uo_out[5]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT6(tt_project_3_uo_out[6]),
        .Tile_X0Y5_UO_OUT_TT_PROJECT7(tt_project_3_uo_out[7]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT0(tt_project_3_uio_in[0]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT1(tt_project_3_uio_in[1]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT2(tt_project_3_uio_in[2]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT3(tt_project_3_uio_in[3]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT4(tt_project_3_uio_in[4]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT5(tt_project_3_uio_in[5]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT6(tt_project_3_uio_in[6]),
        .Tile_X0Y5_UIO_IN_TT_PROJECT7(tt_project_3_uio_in[7]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT0(tt_project_3_uio_out[0]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT1(tt_project_3_uio_out[1]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT2(tt_project_3_uio_out[2]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT3(tt_project_3_uio_out[3]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT4(tt_project_3_uio_out[4]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT5(tt_project_3_uio_out[5]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT6(tt_project_3_uio_out[6]),
        .Tile_X0Y5_UIO_OUT_TT_PROJECT7(tt_project_3_uio_out[7]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT0(tt_project_3_uio_oe[0]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT1(tt_project_3_uio_oe[1]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT2(tt_project_3_uio_oe[2]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT3(tt_project_3_uio_oe[3]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT4(tt_project_3_uio_oe[4]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT5(tt_project_3_uio_oe[5]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT6(tt_project_3_uio_oe[6]),
        .Tile_X0Y5_UIO_OE_TT_PROJECT7(tt_project_3_uio_oe[7]),
        .Tile_X0Y5_ENA_TT_PROJECT(tt_project_3_ena),
        .Tile_X0Y5_CLK_TT_PROJECT(tt_project_3_clk),
        .Tile_X0Y5_RST_N_TT_PROJECT(tt_project_3_rst_n),

        // TT_PROJECT 4 (X0Y6)
        .Tile_X0Y6_UI_IN_TT_PROJECT0(tt_project_4_ui_in[0]),
        .Tile_X0Y6_UI_IN_TT_PROJECT1(tt_project_4_ui_in[1]),
        .Tile_X0Y6_UI_IN_TT_PROJECT2(tt_project_4_ui_in[2]),
        .Tile_X0Y6_UI_IN_TT_PROJECT3(tt_project_4_ui_in[3]),
        .Tile_X0Y6_UI_IN_TT_PROJECT4(tt_project_4_ui_in[4]),
        .Tile_X0Y6_UI_IN_TT_PROJECT5(tt_project_4_ui_in[5]),
        .Tile_X0Y6_UI_IN_TT_PROJECT6(tt_project_4_ui_in[6]),
        .Tile_X0Y6_UI_IN_TT_PROJECT7(tt_project_4_ui_in[7]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT0(tt_project_4_uo_out[0]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT1(tt_project_4_uo_out[1]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT2(tt_project_4_uo_out[2]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT3(tt_project_4_uo_out[3]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT4(tt_project_4_uo_out[4]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT5(tt_project_4_uo_out[5]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT6(tt_project_4_uo_out[6]),
        .Tile_X0Y6_UO_OUT_TT_PROJECT7(tt_project_4_uo_out[7]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT0(tt_project_4_uio_in[0]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT1(tt_project_4_uio_in[1]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT2(tt_project_4_uio_in[2]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT3(tt_project_4_uio_in[3]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT4(tt_project_4_uio_in[4]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT5(tt_project_4_uio_in[5]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT6(tt_project_4_uio_in[6]),
        .Tile_X0Y6_UIO_IN_TT_PROJECT7(tt_project_4_uio_in[7]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT0(tt_project_4_uio_out[0]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT1(tt_project_4_uio_out[1]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT2(tt_project_4_uio_out[2]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT3(tt_project_4_uio_out[3]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT4(tt_project_4_uio_out[4]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT5(tt_project_4_uio_out[5]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT6(tt_project_4_uio_out[6]),
        .Tile_X0Y6_UIO_OUT_TT_PROJECT7(tt_project_4_uio_out[7]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT0(tt_project_4_uio_oe[0]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT1(tt_project_4_uio_oe[1]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT2(tt_project_4_uio_oe[2]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT3(tt_project_4_uio_oe[3]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT4(tt_project_4_uio_oe[4]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT5(tt_project_4_uio_oe[5]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT6(tt_project_4_uio_oe[6]),
        .Tile_X0Y6_UIO_OE_TT_PROJECT7(tt_project_4_uio_oe[7]),
        .Tile_X0Y6_ENA_TT_PROJECT(tt_project_4_ena),
        .Tile_X0Y6_CLK_TT_PROJECT(tt_project_4_clk),
        .Tile_X0Y6_RST_N_TT_PROJECT(tt_project_4_rst_n),

        // TT_PROJECT 5 (X0Y7)
        .Tile_X0Y7_UI_IN_TT_PROJECT0(tt_project_5_ui_in[0]),
        .Tile_X0Y7_UI_IN_TT_PROJECT1(tt_project_5_ui_in[1]),
        .Tile_X0Y7_UI_IN_TT_PROJECT2(tt_project_5_ui_in[2]),
        .Tile_X0Y7_UI_IN_TT_PROJECT3(tt_project_5_ui_in[3]),
        .Tile_X0Y7_UI_IN_TT_PROJECT4(tt_project_5_ui_in[4]),
        .Tile_X0Y7_UI_IN_TT_PROJECT5(tt_project_5_ui_in[5]),
        .Tile_X0Y7_UI_IN_TT_PROJECT6(tt_project_5_ui_in[6]),
        .Tile_X0Y7_UI_IN_TT_PROJECT7(tt_project_5_ui_in[7]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT0(tt_project_5_uo_out[0]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT1(tt_project_5_uo_out[1]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT2(tt_project_5_uo_out[2]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT3(tt_project_5_uo_out[3]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT4(tt_project_5_uo_out[4]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT5(tt_project_5_uo_out[5]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT6(tt_project_5_uo_out[6]),
        .Tile_X0Y7_UO_OUT_TT_PROJECT7(tt_project_5_uo_out[7]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT0(tt_project_5_uio_in[0]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT1(tt_project_5_uio_in[1]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT2(tt_project_5_uio_in[2]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT3(tt_project_5_uio_in[3]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT4(tt_project_5_uio_in[4]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT5(tt_project_5_uio_in[5]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT6(tt_project_5_uio_in[6]),
        .Tile_X0Y7_UIO_IN_TT_PROJECT7(tt_project_5_uio_in[7]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT0(tt_project_5_uio_out[0]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT1(tt_project_5_uio_out[1]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT2(tt_project_5_uio_out[2]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT3(tt_project_5_uio_out[3]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT4(tt_project_5_uio_out[4]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT5(tt_project_5_uio_out[5]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT6(tt_project_5_uio_out[6]),
        .Tile_X0Y7_UIO_OUT_TT_PROJECT7(tt_project_5_uio_out[7]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT0(tt_project_5_uio_oe[0]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT1(tt_project_5_uio_oe[1]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT2(tt_project_5_uio_oe[2]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT3(tt_project_5_uio_oe[3]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT4(tt_project_5_uio_oe[4]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT5(tt_project_5_uio_oe[5]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT6(tt_project_5_uio_oe[6]),
        .Tile_X0Y7_UIO_OE_TT_PROJECT7(tt_project_5_uio_oe[7]),
        .Tile_X0Y7_ENA_TT_PROJECT(tt_project_5_ena),
        .Tile_X0Y7_CLK_TT_PROJECT(tt_project_5_clk),
        .Tile_X0Y7_RST_N_TT_PROJECT(tt_project_5_rst_n),

        // TT_PROJECT 6 (X0Y9)
        .Tile_X0Y9_UI_IN_TT_PROJECT0(tt_project_6_ui_in[0]),
        .Tile_X0Y9_UI_IN_TT_PROJECT1(tt_project_6_ui_in[1]),
        .Tile_X0Y9_UI_IN_TT_PROJECT2(tt_project_6_ui_in[2]),
        .Tile_X0Y9_UI_IN_TT_PROJECT3(tt_project_6_ui_in[3]),
        .Tile_X0Y9_UI_IN_TT_PROJECT4(tt_project_6_ui_in[4]),
        .Tile_X0Y9_UI_IN_TT_PROJECT5(tt_project_6_ui_in[5]),
        .Tile_X0Y9_UI_IN_TT_PROJECT6(tt_project_6_ui_in[6]),
        .Tile_X0Y9_UI_IN_TT_PROJECT7(tt_project_6_ui_in[7]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT0(tt_project_6_uo_out[0]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT1(tt_project_6_uo_out[1]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT2(tt_project_6_uo_out[2]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT3(tt_project_6_uo_out[3]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT4(tt_project_6_uo_out[4]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT5(tt_project_6_uo_out[5]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT6(tt_project_6_uo_out[6]),
        .Tile_X0Y9_UO_OUT_TT_PROJECT7(tt_project_6_uo_out[7]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT0(tt_project_6_uio_in[0]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT1(tt_project_6_uio_in[1]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT2(tt_project_6_uio_in[2]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT3(tt_project_6_uio_in[3]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT4(tt_project_6_uio_in[4]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT5(tt_project_6_uio_in[5]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT6(tt_project_6_uio_in[6]),
        .Tile_X0Y9_UIO_IN_TT_PROJECT7(tt_project_6_uio_in[7]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT0(tt_project_6_uio_out[0]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT1(tt_project_6_uio_out[1]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT2(tt_project_6_uio_out[2]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT3(tt_project_6_uio_out[3]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT4(tt_project_6_uio_out[4]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT5(tt_project_6_uio_out[5]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT6(tt_project_6_uio_out[6]),
        .Tile_X0Y9_UIO_OUT_TT_PROJECT7(tt_project_6_uio_out[7]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT0(tt_project_6_uio_oe[0]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT1(tt_project_6_uio_oe[1]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT2(tt_project_6_uio_oe[2]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT3(tt_project_6_uio_oe[3]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT4(tt_project_6_uio_oe[4]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT5(tt_project_6_uio_oe[5]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT6(tt_project_6_uio_oe[6]),
        .Tile_X0Y9_UIO_OE_TT_PROJECT7(tt_project_6_uio_oe[7]),
        .Tile_X0Y9_ENA_TT_PROJECT(tt_project_6_ena),
        .Tile_X0Y9_CLK_TT_PROJECT(tt_project_6_clk),
        .Tile_X0Y9_RST_N_TT_PROJECT(tt_project_6_rst_n),

        // TT_PROJECT 7 (X5Y1)
        .Tile_X5Y1_UI_IN_TT_PROJECT0(tt_project_7_ui_in[0]),
        .Tile_X5Y1_UI_IN_TT_PROJECT1(tt_project_7_ui_in[1]),
        .Tile_X5Y1_UI_IN_TT_PROJECT2(tt_project_7_ui_in[2]),
        .Tile_X5Y1_UI_IN_TT_PROJECT3(tt_project_7_ui_in[3]),
        .Tile_X5Y1_UI_IN_TT_PROJECT4(tt_project_7_ui_in[4]),
        .Tile_X5Y1_UI_IN_TT_PROJECT5(tt_project_7_ui_in[5]),
        .Tile_X5Y1_UI_IN_TT_PROJECT6(tt_project_7_ui_in[6]),
        .Tile_X5Y1_UI_IN_TT_PROJECT7(tt_project_7_ui_in[7]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT0(tt_project_7_uo_out[0]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT1(tt_project_7_uo_out[1]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT2(tt_project_7_uo_out[2]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT3(tt_project_7_uo_out[3]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT4(tt_project_7_uo_out[4]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT5(tt_project_7_uo_out[5]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT6(tt_project_7_uo_out[6]),
        .Tile_X5Y1_UO_OUT_TT_PROJECT7(tt_project_7_uo_out[7]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT0(tt_project_7_uio_in[0]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT1(tt_project_7_uio_in[1]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT2(tt_project_7_uio_in[2]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT3(tt_project_7_uio_in[3]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT4(tt_project_7_uio_in[4]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT5(tt_project_7_uio_in[5]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT6(tt_project_7_uio_in[6]),
        .Tile_X5Y1_UIO_IN_TT_PROJECT7(tt_project_7_uio_in[7]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT0(tt_project_7_uio_out[0]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT1(tt_project_7_uio_out[1]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT2(tt_project_7_uio_out[2]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT3(tt_project_7_uio_out[3]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT4(tt_project_7_uio_out[4]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT5(tt_project_7_uio_out[5]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT6(tt_project_7_uio_out[6]),
        .Tile_X5Y1_UIO_OUT_TT_PROJECT7(tt_project_7_uio_out[7]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT0(tt_project_7_uio_oe[0]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT1(tt_project_7_uio_oe[1]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT2(tt_project_7_uio_oe[2]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT3(tt_project_7_uio_oe[3]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT4(tt_project_7_uio_oe[4]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT5(tt_project_7_uio_oe[5]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT6(tt_project_7_uio_oe[6]),
        .Tile_X5Y1_UIO_OE_TT_PROJECT7(tt_project_7_uio_oe[7]),
        .Tile_X5Y1_ENA_TT_PROJECT(tt_project_7_ena),
        .Tile_X5Y1_CLK_TT_PROJECT(tt_project_7_clk),
        .Tile_X5Y1_RST_N_TT_PROJECT(tt_project_7_rst_n),

        // TT_PROJECT 8 (X5Y2)
        .Tile_X5Y2_UI_IN_TT_PROJECT0(tt_project_8_ui_in[0]),
        .Tile_X5Y2_UI_IN_TT_PROJECT1(tt_project_8_ui_in[1]),
        .Tile_X5Y2_UI_IN_TT_PROJECT2(tt_project_8_ui_in[2]),
        .Tile_X5Y2_UI_IN_TT_PROJECT3(tt_project_8_ui_in[3]),
        .Tile_X5Y2_UI_IN_TT_PROJECT4(tt_project_8_ui_in[4]),
        .Tile_X5Y2_UI_IN_TT_PROJECT5(tt_project_8_ui_in[5]),
        .Tile_X5Y2_UI_IN_TT_PROJECT6(tt_project_8_ui_in[6]),
        .Tile_X5Y2_UI_IN_TT_PROJECT7(tt_project_8_ui_in[7]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT0(tt_project_8_uo_out[0]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT1(tt_project_8_uo_out[1]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT2(tt_project_8_uo_out[2]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT3(tt_project_8_uo_out[3]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT4(tt_project_8_uo_out[4]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT5(tt_project_8_uo_out[5]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT6(tt_project_8_uo_out[6]),
        .Tile_X5Y2_UO_OUT_TT_PROJECT7(tt_project_8_uo_out[7]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT0(tt_project_8_uio_in[0]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT1(tt_project_8_uio_in[1]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT2(tt_project_8_uio_in[2]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT3(tt_project_8_uio_in[3]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT4(tt_project_8_uio_in[4]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT5(tt_project_8_uio_in[5]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT6(tt_project_8_uio_in[6]),
        .Tile_X5Y2_UIO_IN_TT_PROJECT7(tt_project_8_uio_in[7]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT0(tt_project_8_uio_out[0]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT1(tt_project_8_uio_out[1]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT2(tt_project_8_uio_out[2]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT3(tt_project_8_uio_out[3]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT4(tt_project_8_uio_out[4]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT5(tt_project_8_uio_out[5]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT6(tt_project_8_uio_out[6]),
        .Tile_X5Y2_UIO_OUT_TT_PROJECT7(tt_project_8_uio_out[7]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT0(tt_project_8_uio_oe[0]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT1(tt_project_8_uio_oe[1]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT2(tt_project_8_uio_oe[2]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT3(tt_project_8_uio_oe[3]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT4(tt_project_8_uio_oe[4]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT5(tt_project_8_uio_oe[5]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT6(tt_project_8_uio_oe[6]),
        .Tile_X5Y2_UIO_OE_TT_PROJECT7(tt_project_8_uio_oe[7]),
        .Tile_X5Y2_ENA_TT_PROJECT(tt_project_8_ena),
        .Tile_X5Y2_CLK_TT_PROJECT(tt_project_8_clk),
        .Tile_X5Y2_RST_N_TT_PROJECT(tt_project_8_rst_n),

        // TT_PROJECT 9 (X5Y3)
        .Tile_X5Y3_UI_IN_TT_PROJECT0(tt_project_9_ui_in[0]),
        .Tile_X5Y3_UI_IN_TT_PROJECT1(tt_project_9_ui_in[1]),
        .Tile_X5Y3_UI_IN_TT_PROJECT2(tt_project_9_ui_in[2]),
        .Tile_X5Y3_UI_IN_TT_PROJECT3(tt_project_9_ui_in[3]),
        .Tile_X5Y3_UI_IN_TT_PROJECT4(tt_project_9_ui_in[4]),
        .Tile_X5Y3_UI_IN_TT_PROJECT5(tt_project_9_ui_in[5]),
        .Tile_X5Y3_UI_IN_TT_PROJECT6(tt_project_9_ui_in[6]),
        .Tile_X5Y3_UI_IN_TT_PROJECT7(tt_project_9_ui_in[7]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT0(tt_project_9_uo_out[0]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT1(tt_project_9_uo_out[1]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT2(tt_project_9_uo_out[2]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT3(tt_project_9_uo_out[3]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT4(tt_project_9_uo_out[4]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT5(tt_project_9_uo_out[5]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT6(tt_project_9_uo_out[6]),
        .Tile_X5Y3_UO_OUT_TT_PROJECT7(tt_project_9_uo_out[7]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT0(tt_project_9_uio_in[0]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT1(tt_project_9_uio_in[1]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT2(tt_project_9_uio_in[2]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT3(tt_project_9_uio_in[3]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT4(tt_project_9_uio_in[4]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT5(tt_project_9_uio_in[5]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT6(tt_project_9_uio_in[6]),
        .Tile_X5Y3_UIO_IN_TT_PROJECT7(tt_project_9_uio_in[7]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT0(tt_project_9_uio_out[0]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT1(tt_project_9_uio_out[1]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT2(tt_project_9_uio_out[2]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT3(tt_project_9_uio_out[3]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT4(tt_project_9_uio_out[4]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT5(tt_project_9_uio_out[5]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT6(tt_project_9_uio_out[6]),
        .Tile_X5Y3_UIO_OUT_TT_PROJECT7(tt_project_9_uio_out[7]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT0(tt_project_9_uio_oe[0]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT1(tt_project_9_uio_oe[1]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT2(tt_project_9_uio_oe[2]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT3(tt_project_9_uio_oe[3]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT4(tt_project_9_uio_oe[4]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT5(tt_project_9_uio_oe[5]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT6(tt_project_9_uio_oe[6]),
        .Tile_X5Y3_UIO_OE_TT_PROJECT7(tt_project_9_uio_oe[7]),
        .Tile_X5Y3_ENA_TT_PROJECT(tt_project_9_ena),
        .Tile_X5Y3_CLK_TT_PROJECT(tt_project_9_clk),
        .Tile_X5Y3_RST_N_TT_PROJECT(tt_project_9_rst_n),

        // TT_PROJECT 10 (X5Y4)
        .Tile_X5Y4_UI_IN_TT_PROJECT0(tt_project_10_ui_in[0]),
        .Tile_X5Y4_UI_IN_TT_PROJECT1(tt_project_10_ui_in[1]),
        .Tile_X5Y4_UI_IN_TT_PROJECT2(tt_project_10_ui_in[2]),
        .Tile_X5Y4_UI_IN_TT_PROJECT3(tt_project_10_ui_in[3]),
        .Tile_X5Y4_UI_IN_TT_PROJECT4(tt_project_10_ui_in[4]),
        .Tile_X5Y4_UI_IN_TT_PROJECT5(tt_project_10_ui_in[5]),
        .Tile_X5Y4_UI_IN_TT_PROJECT6(tt_project_10_ui_in[6]),
        .Tile_X5Y4_UI_IN_TT_PROJECT7(tt_project_10_ui_in[7]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT0(tt_project_10_uo_out[0]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT1(tt_project_10_uo_out[1]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT2(tt_project_10_uo_out[2]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT3(tt_project_10_uo_out[3]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT4(tt_project_10_uo_out[4]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT5(tt_project_10_uo_out[5]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT6(tt_project_10_uo_out[6]),
        .Tile_X5Y4_UO_OUT_TT_PROJECT7(tt_project_10_uo_out[7]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT0(tt_project_10_uio_in[0]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT1(tt_project_10_uio_in[1]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT2(tt_project_10_uio_in[2]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT3(tt_project_10_uio_in[3]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT4(tt_project_10_uio_in[4]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT5(tt_project_10_uio_in[5]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT6(tt_project_10_uio_in[6]),
        .Tile_X5Y4_UIO_IN_TT_PROJECT7(tt_project_10_uio_in[7]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT0(tt_project_10_uio_out[0]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT1(tt_project_10_uio_out[1]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT2(tt_project_10_uio_out[2]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT3(tt_project_10_uio_out[3]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT4(tt_project_10_uio_out[4]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT5(tt_project_10_uio_out[5]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT6(tt_project_10_uio_out[6]),
        .Tile_X5Y4_UIO_OUT_TT_PROJECT7(tt_project_10_uio_out[7]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT0(tt_project_10_uio_oe[0]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT1(tt_project_10_uio_oe[1]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT2(tt_project_10_uio_oe[2]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT3(tt_project_10_uio_oe[3]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT4(tt_project_10_uio_oe[4]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT5(tt_project_10_uio_oe[5]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT6(tt_project_10_uio_oe[6]),
        .Tile_X5Y4_UIO_OE_TT_PROJECT7(tt_project_10_uio_oe[7]),
        .Tile_X5Y4_ENA_TT_PROJECT(tt_project_10_ena),
        .Tile_X5Y4_CLK_TT_PROJECT(tt_project_10_clk),
        .Tile_X5Y4_RST_N_TT_PROJECT(tt_project_10_rst_n),

        // TT_PROJECT 11 (X5Y7)
        .Tile_X5Y7_UI_IN_TT_PROJECT0(tt_project_11_ui_in[0]),
        .Tile_X5Y7_UI_IN_TT_PROJECT1(tt_project_11_ui_in[1]),
        .Tile_X5Y7_UI_IN_TT_PROJECT2(tt_project_11_ui_in[2]),
        .Tile_X5Y7_UI_IN_TT_PROJECT3(tt_project_11_ui_in[3]),
        .Tile_X5Y7_UI_IN_TT_PROJECT4(tt_project_11_ui_in[4]),
        .Tile_X5Y7_UI_IN_TT_PROJECT5(tt_project_11_ui_in[5]),
        .Tile_X5Y7_UI_IN_TT_PROJECT6(tt_project_11_ui_in[6]),
        .Tile_X5Y7_UI_IN_TT_PROJECT7(tt_project_11_ui_in[7]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT0(tt_project_11_uo_out[0]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT1(tt_project_11_uo_out[1]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT2(tt_project_11_uo_out[2]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT3(tt_project_11_uo_out[3]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT4(tt_project_11_uo_out[4]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT5(tt_project_11_uo_out[5]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT6(tt_project_11_uo_out[6]),
        .Tile_X5Y7_UO_OUT_TT_PROJECT7(tt_project_11_uo_out[7]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT0(tt_project_11_uio_in[0]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT1(tt_project_11_uio_in[1]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT2(tt_project_11_uio_in[2]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT3(tt_project_11_uio_in[3]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT4(tt_project_11_uio_in[4]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT5(tt_project_11_uio_in[5]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT6(tt_project_11_uio_in[6]),
        .Tile_X5Y7_UIO_IN_TT_PROJECT7(tt_project_11_uio_in[7]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT0(tt_project_11_uio_out[0]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT1(tt_project_11_uio_out[1]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT2(tt_project_11_uio_out[2]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT3(tt_project_11_uio_out[3]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT4(tt_project_11_uio_out[4]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT5(tt_project_11_uio_out[5]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT6(tt_project_11_uio_out[6]),
        .Tile_X5Y7_UIO_OUT_TT_PROJECT7(tt_project_11_uio_out[7]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT0(tt_project_11_uio_oe[0]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT1(tt_project_11_uio_oe[1]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT2(tt_project_11_uio_oe[2]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT3(tt_project_11_uio_oe[3]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT4(tt_project_11_uio_oe[4]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT5(tt_project_11_uio_oe[5]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT6(tt_project_11_uio_oe[6]),
        .Tile_X5Y7_UIO_OE_TT_PROJECT7(tt_project_11_uio_oe[7]),
        .Tile_X5Y7_ENA_TT_PROJECT(tt_project_11_ena),
        .Tile_X5Y7_CLK_TT_PROJECT(tt_project_11_clk),
        .Tile_X5Y7_RST_N_TT_PROJECT(tt_project_11_rst_n),

        // TT_PROJECT 12 (X5Y8)
        .Tile_X5Y8_UI_IN_TT_PROJECT0(tt_project_12_ui_in[0]),
        .Tile_X5Y8_UI_IN_TT_PROJECT1(tt_project_12_ui_in[1]),
        .Tile_X5Y8_UI_IN_TT_PROJECT2(tt_project_12_ui_in[2]),
        .Tile_X5Y8_UI_IN_TT_PROJECT3(tt_project_12_ui_in[3]),
        .Tile_X5Y8_UI_IN_TT_PROJECT4(tt_project_12_ui_in[4]),
        .Tile_X5Y8_UI_IN_TT_PROJECT5(tt_project_12_ui_in[5]),
        .Tile_X5Y8_UI_IN_TT_PROJECT6(tt_project_12_ui_in[6]),
        .Tile_X5Y8_UI_IN_TT_PROJECT7(tt_project_12_ui_in[7]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT0(tt_project_12_uo_out[0]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT1(tt_project_12_uo_out[1]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT2(tt_project_12_uo_out[2]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT3(tt_project_12_uo_out[3]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT4(tt_project_12_uo_out[4]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT5(tt_project_12_uo_out[5]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT6(tt_project_12_uo_out[6]),
        .Tile_X5Y8_UO_OUT_TT_PROJECT7(tt_project_12_uo_out[7]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT0(tt_project_12_uio_in[0]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT1(tt_project_12_uio_in[1]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT2(tt_project_12_uio_in[2]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT3(tt_project_12_uio_in[3]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT4(tt_project_12_uio_in[4]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT5(tt_project_12_uio_in[5]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT6(tt_project_12_uio_in[6]),
        .Tile_X5Y8_UIO_IN_TT_PROJECT7(tt_project_12_uio_in[7]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT0(tt_project_12_uio_out[0]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT1(tt_project_12_uio_out[1]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT2(tt_project_12_uio_out[2]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT3(tt_project_12_uio_out[3]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT4(tt_project_12_uio_out[4]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT5(tt_project_12_uio_out[5]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT6(tt_project_12_uio_out[6]),
        .Tile_X5Y8_UIO_OUT_TT_PROJECT7(tt_project_12_uio_out[7]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT0(tt_project_12_uio_oe[0]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT1(tt_project_12_uio_oe[1]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT2(tt_project_12_uio_oe[2]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT3(tt_project_12_uio_oe[3]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT4(tt_project_12_uio_oe[4]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT5(tt_project_12_uio_oe[5]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT6(tt_project_12_uio_oe[6]),
        .Tile_X5Y8_UIO_OE_TT_PROJECT7(tt_project_12_uio_oe[7]),
        .Tile_X5Y8_ENA_TT_PROJECT(tt_project_12_ena),
        .Tile_X5Y8_CLK_TT_PROJECT(tt_project_12_clk),
        .Tile_X5Y8_RST_N_TT_PROJECT(tt_project_12_rst_n),

        // TT_PROJECT 13 (X5Y9)
        .Tile_X5Y9_UI_IN_TT_PROJECT0(tt_project_13_ui_in[0]),
        .Tile_X5Y9_UI_IN_TT_PROJECT1(tt_project_13_ui_in[1]),
        .Tile_X5Y9_UI_IN_TT_PROJECT2(tt_project_13_ui_in[2]),
        .Tile_X5Y9_UI_IN_TT_PROJECT3(tt_project_13_ui_in[3]),
        .Tile_X5Y9_UI_IN_TT_PROJECT4(tt_project_13_ui_in[4]),
        .Tile_X5Y9_UI_IN_TT_PROJECT5(tt_project_13_ui_in[5]),
        .Tile_X5Y9_UI_IN_TT_PROJECT6(tt_project_13_ui_in[6]),
        .Tile_X5Y9_UI_IN_TT_PROJECT7(tt_project_13_ui_in[7]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT0(tt_project_13_uo_out[0]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT1(tt_project_13_uo_out[1]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT2(tt_project_13_uo_out[2]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT3(tt_project_13_uo_out[3]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT4(tt_project_13_uo_out[4]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT5(tt_project_13_uo_out[5]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT6(tt_project_13_uo_out[6]),
        .Tile_X5Y9_UO_OUT_TT_PROJECT7(tt_project_13_uo_out[7]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT0(tt_project_13_uio_in[0]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT1(tt_project_13_uio_in[1]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT2(tt_project_13_uio_in[2]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT3(tt_project_13_uio_in[3]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT4(tt_project_13_uio_in[4]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT5(tt_project_13_uio_in[5]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT6(tt_project_13_uio_in[6]),
        .Tile_X5Y9_UIO_IN_TT_PROJECT7(tt_project_13_uio_in[7]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT0(tt_project_13_uio_out[0]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT1(tt_project_13_uio_out[1]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT2(tt_project_13_uio_out[2]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT3(tt_project_13_uio_out[3]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT4(tt_project_13_uio_out[4]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT5(tt_project_13_uio_out[5]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT6(tt_project_13_uio_out[6]),
        .Tile_X5Y9_UIO_OUT_TT_PROJECT7(tt_project_13_uio_out[7]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT0(tt_project_13_uio_oe[0]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT1(tt_project_13_uio_oe[1]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT2(tt_project_13_uio_oe[2]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT3(tt_project_13_uio_oe[3]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT4(tt_project_13_uio_oe[4]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT5(tt_project_13_uio_oe[5]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT6(tt_project_13_uio_oe[6]),
        .Tile_X5Y9_UIO_OE_TT_PROJECT7(tt_project_13_uio_oe[7]),
        .Tile_X5Y9_ENA_TT_PROJECT(tt_project_13_ena),
        .Tile_X5Y9_CLK_TT_PROJECT(tt_project_13_clk),
        .Tile_X5Y9_RST_N_TT_PROJECT(tt_project_13_rst_n),

        // SRAM 0
        .Tile_X5Y6_DOUT_SRAM0(fabric_sram0_dout_i[0]),
        .Tile_X5Y6_DOUT_SRAM1(fabric_sram0_dout_i[1]),
        .Tile_X5Y6_DOUT_SRAM2(fabric_sram0_dout_i[2]),
        .Tile_X5Y6_DOUT_SRAM3(fabric_sram0_dout_i[3]),
        .Tile_X5Y6_DOUT_SRAM4(fabric_sram0_dout_i[4]),
        .Tile_X5Y6_DOUT_SRAM5(fabric_sram0_dout_i[5]),
        .Tile_X5Y6_DOUT_SRAM6(fabric_sram0_dout_i[6]),
        .Tile_X5Y6_DOUT_SRAM7(fabric_sram0_dout_i[7]),
        .Tile_X5Y6_DOUT_SRAM8(fabric_sram0_dout_i[8]),
        .Tile_X5Y6_DOUT_SRAM9(fabric_sram0_dout_i[9]),
        .Tile_X5Y6_DOUT_SRAM10(fabric_sram0_dout_i[10]),
        .Tile_X5Y6_DOUT_SRAM11(fabric_sram0_dout_i[11]),
        .Tile_X5Y6_DOUT_SRAM12(fabric_sram0_dout_i[12]),
        .Tile_X5Y6_DOUT_SRAM13(fabric_sram0_dout_i[13]),
        .Tile_X5Y6_DOUT_SRAM14(fabric_sram0_dout_i[14]),
        .Tile_X5Y6_DOUT_SRAM15(fabric_sram0_dout_i[15]),
        .Tile_X5Y6_DOUT_SRAM16(fabric_sram0_dout_i[16]),
        .Tile_X5Y6_DOUT_SRAM17(fabric_sram0_dout_i[17]),
        .Tile_X5Y6_DOUT_SRAM18(fabric_sram0_dout_i[18]),
        .Tile_X5Y6_DOUT_SRAM19(fabric_sram0_dout_i[19]),
        .Tile_X5Y6_DOUT_SRAM20(fabric_sram0_dout_i[20]),
        .Tile_X5Y6_DOUT_SRAM21(fabric_sram0_dout_i[21]),
        .Tile_X5Y6_DOUT_SRAM22(fabric_sram0_dout_i[22]),
        .Tile_X5Y6_DOUT_SRAM23(fabric_sram0_dout_i[23]),
        .Tile_X5Y6_DOUT_SRAM24(fabric_sram0_dout_i[24]),
        .Tile_X5Y6_DOUT_SRAM25(fabric_sram0_dout_i[25]),
        .Tile_X5Y6_DOUT_SRAM26(fabric_sram0_dout_i[26]),
        .Tile_X5Y6_DOUT_SRAM27(fabric_sram0_dout_i[27]),
        .Tile_X5Y6_DOUT_SRAM28(fabric_sram0_dout_i[28]),
        .Tile_X5Y6_DOUT_SRAM29(fabric_sram0_dout_i[29]),
        .Tile_X5Y6_DOUT_SRAM30(fabric_sram0_dout_i[30]),
        .Tile_X5Y6_DOUT_SRAM31(fabric_sram0_dout_i[31]),
        .Tile_X5Y6_ADDR_SRAM0(fabric_sram0_addr_o[0]),
        .Tile_X5Y6_ADDR_SRAM1(fabric_sram0_addr_o[1]),
        .Tile_X5Y6_ADDR_SRAM2(fabric_sram0_addr_o[2]),
        .Tile_X5Y6_ADDR_SRAM3(fabric_sram0_addr_o[3]),
        .Tile_X5Y6_ADDR_SRAM4(fabric_sram0_addr_o[4]),
        .Tile_X5Y6_ADDR_SRAM5(fabric_sram0_addr_o[5]),
        .Tile_X5Y6_ADDR_SRAM6(fabric_sram0_addr_o[6]),
        .Tile_X5Y6_ADDR_SRAM7(fabric_sram0_addr_o[7]),
        .Tile_X5Y6_ADDR_SRAM8(fabric_sram0_addr_o[8]),
        .Tile_X5Y6_ADDR_SRAM9(fabric_sram0_addr_o[9]),
        .Tile_X5Y6_BM_SRAM0(fabric_sram0_bm_o[0]),
        .Tile_X5Y6_BM_SRAM1(fabric_sram0_bm_o[1]),
        .Tile_X5Y6_BM_SRAM2(fabric_sram0_bm_o[2]),
        .Tile_X5Y6_BM_SRAM3(fabric_sram0_bm_o[3]),
        .Tile_X5Y6_BM_SRAM4(fabric_sram0_bm_o[4]),
        .Tile_X5Y6_BM_SRAM5(fabric_sram0_bm_o[5]),
        .Tile_X5Y6_BM_SRAM6(fabric_sram0_bm_o[6]),
        .Tile_X5Y6_BM_SRAM7(fabric_sram0_bm_o[7]),
        .Tile_X5Y6_BM_SRAM8(fabric_sram0_bm_o[8]),
        .Tile_X5Y6_BM_SRAM9(fabric_sram0_bm_o[9]),
        .Tile_X5Y6_BM_SRAM10(fabric_sram0_bm_o[10]),
        .Tile_X5Y6_BM_SRAM11(fabric_sram0_bm_o[11]),
        .Tile_X5Y6_BM_SRAM12(fabric_sram0_bm_o[12]),
        .Tile_X5Y6_BM_SRAM13(fabric_sram0_bm_o[13]),
        .Tile_X5Y6_BM_SRAM14(fabric_sram0_bm_o[14]),
        .Tile_X5Y6_BM_SRAM15(fabric_sram0_bm_o[15]),
        .Tile_X5Y6_BM_SRAM16(fabric_sram0_bm_o[16]),
        .Tile_X5Y6_BM_SRAM17(fabric_sram0_bm_o[17]),
        .Tile_X5Y6_BM_SRAM18(fabric_sram0_bm_o[18]),
        .Tile_X5Y6_BM_SRAM19(fabric_sram0_bm_o[19]),
        .Tile_X5Y6_BM_SRAM20(fabric_sram0_bm_o[20]),
        .Tile_X5Y6_BM_SRAM21(fabric_sram0_bm_o[21]),
        .Tile_X5Y6_BM_SRAM22(fabric_sram0_bm_o[22]),
        .Tile_X5Y6_BM_SRAM23(fabric_sram0_bm_o[23]),
        .Tile_X5Y6_BM_SRAM24(fabric_sram0_bm_o[24]),
        .Tile_X5Y6_BM_SRAM25(fabric_sram0_bm_o[25]),
        .Tile_X5Y6_BM_SRAM26(fabric_sram0_bm_o[26]),
        .Tile_X5Y6_BM_SRAM27(fabric_sram0_bm_o[27]),
        .Tile_X5Y6_BM_SRAM28(fabric_sram0_bm_o[28]),
        .Tile_X5Y6_BM_SRAM29(fabric_sram0_bm_o[29]),
        .Tile_X5Y6_BM_SRAM30(fabric_sram0_bm_o[30]),
        .Tile_X5Y6_BM_SRAM31(fabric_sram0_bm_o[31]),
        .Tile_X5Y6_DIN_SRAM0(fabric_sram0_din_o[0]),
        .Tile_X5Y6_DIN_SRAM1(fabric_sram0_din_o[1]),
        .Tile_X5Y6_DIN_SRAM2(fabric_sram0_din_o[2]),
        .Tile_X5Y6_DIN_SRAM3(fabric_sram0_din_o[3]),
        .Tile_X5Y6_DIN_SRAM4(fabric_sram0_din_o[4]),
        .Tile_X5Y6_DIN_SRAM5(fabric_sram0_din_o[5]),
        .Tile_X5Y6_DIN_SRAM6(fabric_sram0_din_o[6]),
        .Tile_X5Y6_DIN_SRAM7(fabric_sram0_din_o[7]),
        .Tile_X5Y6_DIN_SRAM8(fabric_sram0_din_o[8]),
        .Tile_X5Y6_DIN_SRAM9(fabric_sram0_din_o[9]),
        .Tile_X5Y6_DIN_SRAM10(fabric_sram0_din_o[10]),
        .Tile_X5Y6_DIN_SRAM11(fabric_sram0_din_o[11]),
        .Tile_X5Y6_DIN_SRAM12(fabric_sram0_din_o[12]),
        .Tile_X5Y6_DIN_SRAM13(fabric_sram0_din_o[13]),
        .Tile_X5Y6_DIN_SRAM14(fabric_sram0_din_o[14]),
        .Tile_X5Y6_DIN_SRAM15(fabric_sram0_din_o[15]),
        .Tile_X5Y6_DIN_SRAM16(fabric_sram0_din_o[16]),
        .Tile_X5Y6_DIN_SRAM17(fabric_sram0_din_o[17]),
        .Tile_X5Y6_DIN_SRAM18(fabric_sram0_din_o[18]),
        .Tile_X5Y6_DIN_SRAM19(fabric_sram0_din_o[19]),
        .Tile_X5Y6_DIN_SRAM20(fabric_sram0_din_o[20]),
        .Tile_X5Y6_DIN_SRAM21(fabric_sram0_din_o[21]),
        .Tile_X5Y6_DIN_SRAM22(fabric_sram0_din_o[22]),
        .Tile_X5Y6_DIN_SRAM23(fabric_sram0_din_o[23]),
        .Tile_X5Y6_DIN_SRAM24(fabric_sram0_din_o[24]),
        .Tile_X5Y6_DIN_SRAM25(fabric_sram0_din_o[25]),
        .Tile_X5Y6_DIN_SRAM26(fabric_sram0_din_o[26]),
        .Tile_X5Y6_DIN_SRAM27(fabric_sram0_din_o[27]),
        .Tile_X5Y6_DIN_SRAM28(fabric_sram0_din_o[28]),
        .Tile_X5Y6_DIN_SRAM29(fabric_sram0_din_o[29]),
        .Tile_X5Y6_DIN_SRAM30(fabric_sram0_din_o[30]),
        .Tile_X5Y6_DIN_SRAM31(fabric_sram0_din_o[31]),
        .Tile_X5Y6_WEN_SRAM(fabric_sram0_wen_o),
        .Tile_X5Y6_MEN_SRAM(fabric_sram0_men_o),
        .Tile_X5Y6_REN_SRAM(fabric_sram0_ren_o),
        .Tile_X5Y6_CLK_SRAM(fabric_sram0_clk_o),
        .Tile_X5Y6_TIE_HIGH_SRAM(fabric_sram0_tie_high_o),
        .Tile_X5Y6_TIE_LOW_SRAM(fabric_sram0_tie_low_o),
        .Tile_X5Y6_CONFIGURED_top(configured_i)
    );

    heichips25_snitch_wrapper heichips25_example_large_0 (
        .clk        (tt_project_0_clk),
        .rst_n      (tt_project_0_rst_n),
        .ena        (tt_project_0_ena),
        .ui_in      (tt_project_0_ui_in),
        .uio_in     (tt_project_0_uio_in),
        .uo_out     (tt_project_0_uo_out),
        .uio_out    (tt_project_0_uio_out),
        .uio_oe     (tt_project_0_uio_oe)
    );

    heichips25_CORDIC heichips25_example_small_0 (
        .clk        (tt_project_1_clk),
        .rst_n      (tt_project_1_rst_n),
        .ena        (tt_project_1_ena),
        .ui_in      (tt_project_1_ui_in),
        .uio_in     (tt_project_1_uio_in),
        .uo_out     (tt_project_1_uo_out),
        .uio_out    (tt_project_1_uio_out),
        .uio_oe     (tt_project_1_uio_oe)
    );

    heichips25_tiny_wrapper2 heichips25_example_small_1 (
        .clk        (tt_project_2_clk),
        .rst_n      (tt_project_2_rst_n),
        .ena        (tt_project_2_ena),
        .ui_in      (tt_project_2_ui_in),
        .uio_in     (tt_project_2_uio_in),
        .uo_out     (tt_project_2_uo_out),
        .uio_out    (tt_project_2_uio_out),
        .uio_oe     (tt_project_2_uio_oe)
    );

    heichips25_top_sorter heichips25_example_small_2 (
        .clk        (tt_project_3_clk),
        .rst_n      (tt_project_3_rst_n),
        .ena        (tt_project_3_ena),
        .ui_in      (tt_project_3_ui_in),
        .uio_in     (tt_project_3_uio_in),
        .uo_out     (tt_project_3_uo_out),
        .uio_out    (tt_project_3_uio_out),
        .uio_oe     (tt_project_3_uio_oe)
    );

    heichips25_systolicArrayTop heichips25_example_small_3 (
        .clk        (tt_project_4_clk),
        .rst_n      (tt_project_4_rst_n),
        .ena        (tt_project_4_ena),
        .ui_in      (tt_project_4_ui_in),
        .uio_in     (tt_project_4_uio_in),
        .uo_out     (tt_project_4_uo_out),
        .uio_out    (tt_project_4_uio_out),
        .uio_oe     (tt_project_4_uio_oe)
    );

    heichips25_pudding heichips25_example_small_4 (
        .clk        (tt_project_5_clk),
        .rst_n      (tt_project_5_rst_n),
        .ena        (tt_project_5_ena),
        .ui_in      (tt_project_5_ui_in),
        .uio_in     (tt_project_5_uio_in),
        .uo_out     (tt_project_5_uo_out),
        .uio_out    (tt_project_5_uio_out),
        .uio_oe     (tt_project_5_uio_oe),
        .i_in  (pudding_i_in),
        .i_out (pudding_i_out)
    );

    heichips25_fazyrv_exotiny heichips25_example_large_1 (
        .clk        (tt_project_6_clk),
        .rst_n      (tt_project_6_rst_n),
        .ena        (tt_project_6_ena),
        .ui_in      (tt_project_6_ui_in),
        .uio_in     (tt_project_6_uio_in),
        .uo_out     (tt_project_6_uo_out),
        .uio_out    (tt_project_6_uio_out),
        .uio_oe     (tt_project_6_uio_oe)
    );

    heichips25_internal heichips25_example_small_5 (
        .clk        (tt_project_7_clk),
        .rst_n      (tt_project_7_rst_n),
        .ena        (tt_project_7_ena),
        .ui_in      (tt_project_7_ui_in),
        .uio_in     (tt_project_7_uio_in),
        .uo_out     (tt_project_7_uo_out),
        .uio_out    (tt_project_7_uio_out),
        .uio_oe     (tt_project_7_uio_oe),
        // DLL
        .analog_pin0  (internal_analog_pin0),
        .analog_pin1  (internal_analog_pin1),
        .analog_pin2  (internal_analog_pin2)
    );

    heichips25_ethernet heichips25_example_small_6 (
        .clk        (tt_project_8_clk),
        .rst_n      (tt_project_8_rst_n),
        .ena        (tt_project_8_ena),
        .ui_in      (tt_project_8_ui_in),
        .uio_in     (tt_project_8_uio_in),
        .uo_out     (tt_project_8_uo_out),
        .uio_out    (tt_project_8_uio_out),
        .uio_oe     (tt_project_8_uio_oe),
        .ethernet_dp  (ethernet_dp),
        .ethernet_dn  (ethernet_dn)
    );

    heichips25_SDR heichips25_example_small_7 (
        .clk        (tt_project_9_clk),
        .rst_n      (tt_project_9_rst_n),
        .ena        (tt_project_9_ena),
        .ui_in      (tt_project_9_ui_in),
        .uio_in     (tt_project_9_uio_in),
        .uo_out     (tt_project_9_uo_out),
        .uio_out    (tt_project_9_uio_out),
        .uio_oe     (tt_project_9_uio_oe)
    );

    heichips25_ICELab heichips25_example_small_8 (
        .clk        (tt_project_10_clk),
        .rst_n      (tt_project_10_rst_n),
        .ena        (tt_project_10_ena),
        .ui_in      (tt_project_10_ui_in),
        .uio_in     (tt_project_10_uio_in),
        .uo_out     (tt_project_10_uo_out),
        .uio_out    (tt_project_10_uio_out),
        .uio_oe     (tt_project_10_uio_oe),
        // DLL
        .analog_pin0  (icelab_analog_pin0),
        .analog_pin1  (icelab_analog_pin1),
        .analog_pin2  (icelab_analog_pin2),
        .analog_pin3  (icelab_analog_pin3)
    );

    heichips25_bagel heichips25_example_small_9 (
        .clk        (tt_project_11_clk),
        .rst_n      (tt_project_11_rst_n),
        .ena        (tt_project_11_ena),
        .ui_in      (tt_project_11_ui_in),
        .uio_in     (tt_project_11_uio_in),
        .uo_out     (tt_project_11_uo_out),
        .uio_out    (tt_project_11_uio_out),
        .uio_oe     (tt_project_11_uio_oe),
        .tmds_b     (tmds_b),
        .tmds_g     (tmds_g),
        .tmds_r     (tmds_r),
        .tmds_clk   (tmds_clk)
    );

    heichips25_tiny_wrapper heichips25_example_small_10 (
        .clk        (tt_project_12_clk),
        .rst_n      (tt_project_12_rst_n),
        .ena        (tt_project_12_ena),
        .ui_in      (tt_project_12_ui_in),
        .uio_in     (tt_project_12_uio_in),
        .uo_out     (tt_project_12_uo_out),
        .uio_out    (tt_project_12_uio_out),
        .uio_oe     (tt_project_12_uio_oe)
    );

    heichips25_usb_cdc heichips25_example_small_11 (
        .clk        (tt_project_13_clk),
        .rst_n      (tt_project_13_rst_n),
        .ena        (tt_project_13_ena),
        .ui_in      (tt_project_13_ui_in),
        .uio_in     (tt_project_13_uio_in),
        .uo_out     (tt_project_13_uo_out),
        .uio_out    (tt_project_13_uio_out),
        .uio_oe     (tt_project_13_uio_oe),
        .usb_dn_en_o    (usb_dn_en_o),
        .usb_dn_rx_i    (usb_dn_rx_i),
        .usb_dn_tx_o    (usb_dn_tx_o),
        .usb_dp_en_o    (usb_dp_en_o),
        .usb_dp_rx_i    (usb_dp_rx_i),
        .usb_dp_tx_o    (usb_dp_tx_o),
        .usb_dp_up_o    (usb_dp_up_o)
    );

    // SRAM 0 instances

    logic [31:0] fabric_sram0_dout_sram0_0;
    logic [31:0] fabric_sram0_dout_sram0_1;

    logic select_sram0;
    logic select_sram0_d;
    
    assign select_sram0 = fabric_sram0_addr_o[9];

    always_ff @(posedge fabric_sram0_clk_o) begin
        select_sram0_d <= select_sram0; // Highest bit selects the SRAM
    end

    always_comb begin
        if (select_sram0_d) begin
            fabric_sram0_dout_i = fabric_sram0_dout_sram0_1;
        end else begin
            fabric_sram0_dout_i = fabric_sram0_dout_sram0_0;
        end
    end

    RM_IHPSG13_1P_512x32_c2_bm_bist sram0_0 (
        .A_CLK      (fabric_sram0_clk_o),
        .A_MEN      (fabric_sram0_men_o && select_sram0 == 1'b0),
        .A_WEN      (fabric_sram0_wen_o),
        .A_REN      (fabric_sram0_ren_o),
        .A_ADDR     (fabric_sram0_addr_o[8:0]),
        .A_DIN      (fabric_sram0_din_o),
        .A_DLY      (fabric_sram0_tie_high_o),
        .A_DOUT     (fabric_sram0_dout_sram0_0),
        .A_BM       (fabric_sram0_bm_o),

        .A_BIST_EN      (fabric_sram0_tie_low_o),
        .A_BIST_CLK     (fabric_sram0_tie_low_o),
        .A_BIST_MEN     (fabric_sram0_tie_low_o),
        .A_BIST_WEN     (fabric_sram0_tie_low_o),
        .A_BIST_REN     (fabric_sram0_tie_low_o),
        .A_BIST_ADDR    ({9{fabric_sram0_tie_low_o}}),
        .A_BIST_DIN     ({32{fabric_sram0_tie_low_o}}),
        .A_BIST_BM      ({32{fabric_sram0_tie_low_o}})
    );

    RM_IHPSG13_1P_512x32_c2_bm_bist sram0_1 (
        .A_CLK      (fabric_sram0_clk_o),
        .A_MEN      (fabric_sram0_men_o && select_sram0 == 1'b1),
        .A_WEN      (fabric_sram0_wen_o),
        .A_REN      (fabric_sram0_ren_o),
        .A_ADDR     (fabric_sram0_addr_o[8:0]),
        .A_DIN      (fabric_sram0_din_o),
        .A_DLY      (fabric_sram0_tie_high_o),
        .A_DOUT     (fabric_sram0_dout_sram0_1),
        .A_BM       (fabric_sram0_bm_o),

        .A_BIST_EN      (fabric_sram0_tie_low_o),
        .A_BIST_CLK     (fabric_sram0_tie_low_o),
        .A_BIST_MEN     (fabric_sram0_tie_low_o),
        .A_BIST_WEN     (fabric_sram0_tie_low_o),
        .A_BIST_REN     (fabric_sram0_tie_low_o),
        .A_BIST_ADDR    ({9{fabric_sram0_tie_low_o}}),
        .A_BIST_DIN     ({32{fabric_sram0_tie_low_o}}),
        .A_BIST_BM      ({32{fabric_sram0_tie_low_o}})
    );

endmodule
