// SPDX-FileCopyrightText: © 2025 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

`timescale 1ns/1ps
`default_nettype none

module tb;

    initial begin
        $dumpfile("tb.fst");
        $dumpvars(0, tb);
    end

    parameter FrameBitsPerRow = 32;
    parameter MaxFramesPerCol = 20;

    parameter NumColumns = 11;
    parameter NumRows = 16;

    parameter FABRIC_NUM_IO_WEST = 28;
    parameter FABRIC_NUM_IO_NORTH = 4;

    wire clk_i;
    wire rst_ni;
    
    // Bitstream
    wire  [31:0] bitstream_data_i;
    wire         bitstream_valid_i;
    
    // Configuration in progress
    wire  busy_o;
    
    // Fabric is configured
    wire configured_o;
    
    // To the fabric
    wire [(FrameBitsPerRow*NumRows)-1:0]    FrameData_o;
    wire [(MaxFramesPerCol*NumColumns)-1:0] FrameStrobe_o;
    
    // I/Os West
    wire [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_in_i;
    wire [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_out_o;
    wire [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_oe_o;

    // I/O West config
    wire [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit0_o;
    wire [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit1_o;
    wire [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit2_o;
    wire [FABRIC_NUM_IO_WEST-1:0]      fabric_io_west_config_bit3_o;

    // I/Os North
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_in_i;
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_out_o;
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_oe_o;

    // I/O West config
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit0_o;
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit1_o;
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit2_o;
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_config_bit3_o;

    // WARMBOOT
    wire        fabric_warmboot_boot_o;
    wire  [3:0] fabric_warmboot_slot_o;
    wire        fabric_warmboot_reset_i;
    
    assign fabric_warmboot_reset_i = busy_o;

    // CPU_IRQ
    wire  [3:0] fabric_irq_o;

    // CPU_IF - Selector
    logic            fabric_xif_or_periph_i;
    
    // Custom instruction interface
    logic [31:0]     fabric_rs1_i;
    logic [31:0]     fabric_rs2_i;
    logic [31:0]     fabric_result_o;
    
    // Bus interface
    logic            fabric_gnt_o;
    logic            fabric_req_i;
    logic            fabric_rvalid_o;
    logic            fabric_we_i;
    logic [ 3:0]     fabric_be_i;
    logic [23:0]     fabric_addr_i;
    logic [31:0]     fabric_wdata_i;
    logic [31:0]     fabric_rdata_o;
    
    fabric_config #(
        	.FrameBitsPerRow    (FrameBitsPerRow),
	    .MaxFramesPerCol    (MaxFramesPerCol),
	    
	    .NumColumns         (NumColumns),
	    .NumRows            (NumRows)
    ) fabric_config (
        .clk_i,
        .rst_ni,
        
        // Bitstream
        .bitstream_data_i,
        .bitstream_valid_i,
        
        // Configuration in progress
        .busy_o,
        
        // Fabric is configured
        .configured_o,
        
        // To the fabric
        .FrameData_o,
        .FrameStrobe_o
    );
    
    
    fabric_wrapper fabric_wrapper (
        .clk_i,
        
        // Configuration
        .FrameData_i    (FrameData_o),
        .FrameStrobe_i  (FrameStrobe_o),
        
        // Fabric is configured
        .configured_i   (configured_o),
        
        // I/Os West
        .fabric_io_west_in_i,
        .fabric_io_west_out_o,
        .fabric_io_west_oe_o,

        // I/O West config
        .fabric_io_west_config_bit0_o,
        .fabric_io_west_config_bit1_o,
        .fabric_io_west_config_bit2_o,
        .fabric_io_west_config_bit3_o,
        
        // I/Os North
        .fabric_io_north_in_i,
        .fabric_io_north_out_o,
        .fabric_io_north_oe_o,

        // I/O North config
        .fabric_io_north_config_bit0_o,
        .fabric_io_north_config_bit1_o,
        .fabric_io_north_config_bit2_o,
        .fabric_io_north_config_bit3_o,

        // WARMBOOT
        .fabric_warmboot_boot_o,
        .fabric_warmboot_slot_o,
        .fabric_warmboot_reset_i,

        // CPU_IRQ
        .fabric_irq_o,

        // CPU_IF - Selector
        .fabric_xif_or_periph_i,

        // Custom instruction interface
        .fabric_rs1_i,
        .fabric_rs2_i,
        .fabric_result_o,

        // Bus interface
        .fabric_gnt_o,
        .fabric_req_i,
        .fabric_rvalid_o,
        .fabric_we_i,
        .fabric_be_i,
        .fabric_addr_i,
        .fabric_wdata_i,
        .fabric_rdata_o
    );

endmodule

module clk_buf(input A, output X);
assign X = A;
endmodule

module break_comb_loop(input A, output X);
assign #0.1 X = A;
endmodule
