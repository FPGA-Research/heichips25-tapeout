`default_nettype none

module fabric_wrapper #(
    	parameter FrameBitsPerRow = 32,
	parameter MaxFramesPerCol = 20,
	
	parameter NumColumns = 6,
	parameter NumRows = 10,
	
    parameter FABRIC_NUM_IO_NORTH = 16,
    parameter FABRIC_NUM_IO_SOUTH = 16
)(
    input clk_i,
    
    // Configuration
    input  logic [(FrameBitsPerRow*NumRows)-1:0]    FrameData_i,
    input  logic [(MaxFramesPerCol*NumColumns)-1:0] FrameStrobe_i,
    
    // Fabric is configured
    input                                 configured_i,

    // I/Os North
    input  [FABRIC_NUM_IO_NORTH-1:0]      io_north_in_i,
    output [FABRIC_NUM_IO_NORTH-1:0]      io_north_out_o,
    output [FABRIC_NUM_IO_NORTH-1:0]      io_north_oe_o,

    // I/Os South
    input  [FABRIC_NUM_IO_SOUTH-1:0]      io_south_in_i,
    output [FABRIC_NUM_IO_SOUTH-1:0]      io_south_out_o,
    output [FABRIC_NUM_IO_SOUTH-1:0]      io_south_oe_o
);
    
    eFPGA
    //#(
    //    .MaxFramesPerCol(MaxFramesPerCol),
    //    .FrameBitsPerRow(FrameBitsPerRow)
    //)
    eFPGA
    (
        .FrameData      (FrameData_i),
        .FrameStrobe    (FrameStrobe_i),
        .UserCLK        (clk_i),

        // North I/Os
        .Tile_X1Y0_A_O_top(io_north_in_i[0]),
        .Tile_X1Y0_A_I_top(io_north_out_o[0]),
        .Tile_X1Y0_A_T_top(io_north_oe_o[0]),

        .Tile_X1Y0_B_O_top(io_north_in_i[1]),
        .Tile_X1Y0_B_I_top(io_north_out_o[1]),
        .Tile_X1Y0_B_T_top(io_north_oe_o[1]),

        .Tile_X1Y0_C_O_top(io_north_in_i[2]),
        .Tile_X1Y0_C_I_top(io_north_out_o[2]),
        .Tile_X1Y0_C_T_top(io_north_oe_o[2]),

        .Tile_X1Y0_D_O_top(io_north_in_i[3]),
        .Tile_X1Y0_D_I_top(io_north_out_o[3]),
        .Tile_X1Y0_D_T_top(io_north_oe_o[3]),

        .Tile_X2Y0_A_O_top(io_north_in_i[4]),
        .Tile_X2Y0_A_I_top(io_north_out_o[4]),
        .Tile_X2Y0_A_T_top(io_north_oe_o[4]),

        .Tile_X2Y0_B_O_top(io_north_in_i[5]),
        .Tile_X2Y0_B_I_top(io_north_out_o[5]),
        .Tile_X2Y0_B_T_top(io_north_oe_o[5]),

        .Tile_X2Y0_C_O_top(io_north_in_i[6]),
        .Tile_X2Y0_C_I_top(io_north_out_o[6]),
        .Tile_X2Y0_C_T_top(io_north_oe_o[6]),

        .Tile_X2Y0_D_O_top(io_north_in_i[7]),
        .Tile_X2Y0_D_I_top(io_north_out_o[7]),
        .Tile_X2Y0_D_T_top(io_north_oe_o[7]),

        .Tile_X3Y0_A_O_top(io_north_in_i[8]),
        .Tile_X3Y0_A_I_top(io_north_out_o[8]),
        .Tile_X3Y0_A_T_top(io_north_oe_o[8]),

        .Tile_X3Y0_B_O_top(io_north_in_i[9]),
        .Tile_X3Y0_B_I_top(io_north_out_o[9]),
        .Tile_X3Y0_B_T_top(io_north_oe_o[9]),

        .Tile_X3Y0_C_O_top(io_north_in_i[10]),
        .Tile_X3Y0_C_I_top(io_north_out_o[10]),
        .Tile_X3Y0_C_T_top(io_north_oe_o[10]),

        .Tile_X3Y0_D_O_top(io_north_in_i[11]),
        .Tile_X3Y0_D_I_top(io_north_out_o[11]),
        .Tile_X3Y0_D_T_top(io_north_oe_o[11]),

        .Tile_X4Y0_A_O_top(io_north_in_i[12]),
        .Tile_X4Y0_A_I_top(io_north_out_o[12]),
        .Tile_X4Y0_A_T_top(io_north_oe_o[12]),

        .Tile_X4Y0_B_O_top(io_north_in_i[13]),
        .Tile_X4Y0_B_I_top(io_north_out_o[13]),
        .Tile_X4Y0_B_T_top(io_north_oe_o[13]),

        .Tile_X4Y0_C_O_top(io_north_in_i[14]),
        .Tile_X4Y0_C_I_top(io_north_out_o[14]),
        .Tile_X4Y0_C_T_top(io_north_oe_o[14]),

        .Tile_X4Y0_D_O_top(io_north_in_i[15]),
        .Tile_X4Y0_D_I_top(io_north_out_o[15]),
        .Tile_X4Y0_D_T_top(io_north_oe_o[15]),

        // South I/Os
        .Tile_X1Y9_A_O_top(io_south_in_i[0]),
        .Tile_X1Y9_A_I_top(io_south_out_o[0]),
        .Tile_X1Y9_A_T_top(io_south_oe_o[0]),

        .Tile_X1Y9_B_O_top(io_south_in_i[1]),
        .Tile_X1Y9_B_I_top(io_south_out_o[1]),
        .Tile_X1Y9_B_T_top(io_south_oe_o[1]),

        .Tile_X1Y9_C_O_top(io_south_in_i[2]),
        .Tile_X1Y9_C_I_top(io_south_out_o[2]),
        .Tile_X1Y9_C_T_top(io_south_oe_o[2]),

        .Tile_X1Y9_D_O_top(io_south_in_i[3]),
        .Tile_X1Y9_D_I_top(io_south_out_o[3]),
        .Tile_X1Y9_D_T_top(io_south_oe_o[3]),

        .Tile_X2Y9_A_O_top(io_south_in_i[4]),
        .Tile_X2Y9_A_I_top(io_south_out_o[4]),
        .Tile_X2Y9_A_T_top(io_south_oe_o[4]),

        .Tile_X2Y9_B_O_top(io_south_in_i[5]),
        .Tile_X2Y9_B_I_top(io_south_out_o[5]),
        .Tile_X2Y9_B_T_top(io_south_oe_o[5]),

        .Tile_X2Y9_C_O_top(io_south_in_i[6]),
        .Tile_X2Y9_C_I_top(io_south_out_o[6]),
        .Tile_X2Y9_C_T_top(io_south_oe_o[6]),

        .Tile_X2Y9_D_O_top(io_south_in_i[7]),
        .Tile_X2Y9_D_I_top(io_south_out_o[7]),
        .Tile_X2Y9_D_T_top(io_south_oe_o[7]),

        .Tile_X3Y9_A_O_top(io_south_in_i[8]),
        .Tile_X3Y9_A_I_top(io_south_out_o[8]),
        .Tile_X3Y9_A_T_top(io_south_oe_o[8]),

        .Tile_X3Y9_B_O_top(io_south_in_i[9]),
        .Tile_X3Y9_B_I_top(io_south_out_o[9]),
        .Tile_X3Y9_B_T_top(io_south_oe_o[9]),

        .Tile_X3Y9_C_O_top(io_south_in_i[10]),
        .Tile_X3Y9_C_I_top(io_south_out_o[10]),
        .Tile_X3Y9_C_T_top(io_south_oe_o[10]),

        .Tile_X3Y9_D_O_top(io_south_in_i[11]),
        .Tile_X3Y9_D_I_top(io_south_out_o[11]),
        .Tile_X3Y9_D_T_top(io_south_oe_o[11]),

        .Tile_X4Y9_A_O_top(io_south_in_i[12]),
        .Tile_X4Y9_A_I_top(io_south_out_o[12]),
        .Tile_X4Y9_A_T_top(io_south_oe_o[12]),

        .Tile_X4Y9_B_O_top(io_south_in_i[13]),
        .Tile_X4Y9_B_I_top(io_south_out_o[13]),
        .Tile_X4Y9_B_T_top(io_south_oe_o[13]),

        .Tile_X4Y9_C_O_top(io_south_in_i[14]),
        .Tile_X4Y9_C_I_top(io_south_out_o[14]),
        .Tile_X4Y9_C_T_top(io_south_oe_o[14]),

        .Tile_X4Y9_D_O_top(io_south_in_i[15]),
        .Tile_X4Y9_D_I_top(io_south_out_o[15]),
        .Tile_X4Y9_D_T_top(io_south_oe_o[15])
    );

    // SRAMs

endmodule

`default_nettype wire
