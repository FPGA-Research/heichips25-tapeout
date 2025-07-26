// SPDX-FileCopyrightText: © 2025 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

module heichips25_core (
    // FPGA
    input  logic fpga_clk_i,
    input  logic fpga_rst_ni,

    input  logic fpga_sclk_i,
    output logic fpga_sclk_o,
    output logic fpga_sclk_en_o,
    
    input  logic fpga_cs_n_i,
    output logic fpga_cs_n_o,
    output logic fpga_cs_n_en_o,
    
    input  logic fpga_mosi_i,
    output logic fpga_mosi_o,
    output logic fpga_mosi_en_o,
    
    input  logic fpga_miso_i,
    output logic fpga_miso_o,
    output logic fpga_miso_en_o,

    // FPGA config mode
    // if mode == 0: SPI controller
    // if mode == 1: SPI receiver
    input  logic        fpga_mode_i,
    output logic        fpga_config_busy_o,
    output logic        fpga_config_configured_o,
    input  logic [3:0]  fpga_config_slot_i,
    input  logic        fpga_config_trigger_i,

    // I/Os FPGA
    input  wire [32-1:0] fabric_io_in_i,
    output wire [32-1:0] fabric_io_out_o,
    output wire [32-1:0] fabric_io_oe_o
);
    
    // Fabric parameters
    	localparam FrameBitsPerRow = 32;
    localparam MaxFramesPerCol = 20;
    
    localparam NumColumns = 6;
    localparam NumRows = 10;
    
    localparam FABRIC_NUM_IO_NORTH = 16;
    localparam FABRIC_NUM_IO_SOUTH = 16;

    // I/Os North
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_in_i;
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_out_o;
    wire [FABRIC_NUM_IO_NORTH-1:0]      fabric_io_north_oe_o;
    
    // I/Os South
    wire [FABRIC_NUM_IO_SOUTH-1:0]      fabric_io_south_in_i;
    wire [FABRIC_NUM_IO_SOUTH-1:0]      fabric_io_south_out_o;
    wire [FABRIC_NUM_IO_SOUTH-1:0]      fabric_io_south_oe_o;

    assign fabric_io_north_in_i = fabric_io_in_i[15:0];
    assign fabric_io_out_o[15:0] = fabric_io_north_out_o;
    assign fabric_io_oe_o[15:0] = fabric_io_north_oe_o;

    assign fabric_io_south_in_i = fabric_io_in_i[31:16];
    assign fabric_io_out_o[31:16] = fabric_io_south_out_o;
    assign fabric_io_oe_o[31:16] = fabric_io_south_oe_o;
    
    // Fabric config is currently
    // configuring the fabric
    wire            fabric_config_busy;
    
    // Fabric is configured
    wire            fabric_config_configured;
    assign fpga_config_configured_o = fabric_config_configured;
    
    // Fabric SPI controller is busy
    logic fabric_spi_controller_busy;
    
    // To the fabric
    wire [(FrameBitsPerRow*NumRows)-1:0]    FrameData;
    wire [(MaxFramesPerCol*NumColumns)-1:0] FrameStrobe;
    
    // Reset with asynchronous assertion and synchronous relase
    logic [1:0] fpga_rst_nd;
    logic fpga_rst_n_sync;
    
    always_ff @(posedge fpga_clk_i, negedge fpga_rst_ni) begin
        if (!fpga_rst_ni) begin
            fpga_rst_nd <= '0;
        end else begin
            fpga_rst_nd[0] <= 1'b1;
            fpga_rst_nd[1] <= fpga_rst_nd[0];
        end
    end
    
    assign fpga_rst_n_sync = fpga_rst_nd[1];
    
    // Sync fpga_mode_i
    logic [1:0] fpga_mode_d;
    logic fpga_mode_sync;
    always_ff @(posedge fpga_clk_i) begin
        fpga_mode_d <= {fpga_mode_d[0], fpga_mode_i};
    end
    assign fpga_mode_sync = fpga_mode_d[1];
    
    // Config busy
    assign fpga_config_busy_o = fabric_config_busy;
    
    logic [31:0] spi_bitstream_data, spi_controller_bitstream_data_o, spi_receiver_bitstream_data_o;
    logic        spi_bitstream_valid, spi_controller_bitstream_valid_o, spi_receiver_bitstream_valid_o;
    
    // SPI receiver
    logic spi_receiver_sclk_i;
    logic spi_receiver_cs_ni;
    logic spi_receiver_mosi_i;
    logic spi_receiver_miso_o;
    
    // SPI controller
    logic spi_controller_sclk_o;
    logic spi_controller_cs_no;
    logic spi_controller_mosi_o;
    logic spi_controller_miso_i;
    
    logic spi_controller_start_i;
    logic [3:0] spi_controller_slot_i;

    // At startup, trigger configuration
    // when fpga_mode_sync == 1'b0
    logic startup_trigger;
    always_ff @(posedge fpga_clk_i, negedge fpga_rst_n_sync) begin
        if (!fpga_rst_n_sync) begin
            startup_trigger <= 1'b1;
        end else begin
            startup_trigger <= 1'b0;
        end
    end

    always_comb begin
        // On reset, set SPI to tri-state
        if (!fpga_rst_n_sync) begin
            // Default output
            fpga_sclk_o = 1'b0;
            fpga_cs_n_o = 1'b0;
            fpga_mosi_o = 1'b0;
            fpga_miso_o = 1'b0;
        
            // Tri-state
            fpga_sclk_en_o = 1'b0;
            fpga_cs_n_en_o = 1'b0;
            fpga_mosi_en_o = 1'b0;
            fpga_miso_en_o = 1'b0;
            
            // Receiver not selected
            spi_receiver_sclk_i = 1'b0;
            spi_receiver_cs_ni  = 1'b1;
            spi_receiver_mosi_i = 1'b0;
            
            // Controller not selected
            spi_controller_miso_i = 1'b0;
            
            // No bitstream
            spi_bitstream_data  = '0;
            spi_bitstream_valid = '0;
            
            // Slot and trigger
            spi_controller_slot_i   = '0;
            spi_controller_start_i  = '0;
        end else begin
            // Default output
            fpga_sclk_o = 1'b0;
            fpga_cs_n_o = 1'b0;
            fpga_mosi_o = 1'b0;
            fpga_miso_o = 1'b0;
            
            // Receiver not selected
            spi_receiver_sclk_i = 1'b0;
            spi_receiver_cs_ni  = 1'b1;
            spi_receiver_mosi_i = 1'b0;
            
            // Controller not selected
            spi_controller_miso_i = 1'b0;

            if (fpga_mode_sync == 1'b0) begin
                // SPI Controller
                fpga_sclk_en_o = 1'b1;
                fpga_cs_n_en_o = 1'b1;
                fpga_mosi_en_o = 1'b1;
                fpga_miso_en_o = 1'b0;
                
                fpga_sclk_o = spi_controller_sclk_o;
                fpga_cs_n_o = spi_controller_cs_no;
                fpga_mosi_o = spi_controller_mosi_o;
                spi_controller_miso_i = fpga_miso_i;
                
                // Re-route bitstream
                spi_bitstream_data  = spi_controller_bitstream_data_o;
                spi_bitstream_valid = spi_controller_bitstream_valid_o;
                
                // Slot and trigger
                spi_controller_slot_i   = startup_trigger ? '0 : fpga_config_slot_i; // Always boot from slot 0
                spi_controller_start_i  = startup_trigger || (fpga_config_trigger_i && !(fabric_config_busy || fabric_spi_controller_busy));
                
            end else begin
                // SPI receiver
                fpga_sclk_en_o = 1'b0;
                fpga_cs_n_en_o = 1'b0;
                fpga_mosi_en_o = 1'b0;
                fpga_miso_en_o = 1'b1;
                
                spi_receiver_sclk_i = fpga_sclk_i;
                spi_receiver_cs_ni  = fpga_cs_n_i;
                spi_receiver_mosi_i = fpga_mosi_i;
                fpga_miso_o = spi_receiver_miso_o;
                
                // Re-route bitstream
                spi_bitstream_data  = spi_receiver_bitstream_data_o;
                spi_bitstream_valid = spi_receiver_bitstream_valid_o;
                
                // Slot and trigger
                spi_controller_slot_i   = '0;
                spi_controller_start_i  = '0;
            end
        end
    end

    fabric_spi_receiver fabric_spi_receiver (
        .clk_i  (fpga_clk_i),
        .rst_ni (fpga_rst_n_sync),
        
        // Bitstream data
        .bitstream_data_o   (spi_receiver_bitstream_data_o),
        .bitstream_valid_o  (spi_receiver_bitstream_valid_o),
        
        // Enable the SPI receiver
        .enable_i   (fpga_mode_sync == 1'b1),
        
        // SPI
        .sclk_i     (spi_receiver_sclk_i),
        .cs_ni      (spi_receiver_cs_ni),
        .mosi_i     (spi_receiver_mosi_i),
        .miso_o     (spi_receiver_miso_o)
    );

    // TODO update length
    fabric_spi_controller #(
        .BITSTREAM_LENGTH_WORDS (32'h52E),
        .SLOT_OFFSET_WORDS      (32'h800),
        .NUM_SLOTS              (16)
    ) fabric_spi_controller (
        .clk_i  (fpga_clk_i),
        .rst_ni (fpga_rst_n_sync),
        
        // Start reading data at selected slot
        .start_i    (spi_controller_start_i),
        .slot_i     (spi_controller_slot_i),
        
        // Bitstream data
        .bitstream_data_o    (spi_controller_bitstream_data_o),
        .bitstream_valid_o   (spi_controller_bitstream_valid_o),
        
        // Reading in progress
        .busy_o     (fabric_spi_controller_busy),
        
        // SPI
        .sclk_o     (spi_controller_sclk_o),
        .cs_no      (spi_controller_cs_no),
        .mosi_o     (spi_controller_mosi_o),
        .miso_i     (spi_controller_miso_i)
    );
    
    fabric_config #(
        	.FrameBitsPerRow    (FrameBitsPerRow),
	    .MaxFramesPerCol    (MaxFramesPerCol),
	    
	    .NumColumns         (NumColumns),
	    .NumRows            (NumRows)
    ) fabric_config (
        .clk_i              (fpga_clk_i),
        .rst_ni             (fpga_rst_n_sync),
        
        // Bitstream
        .bitstream_valid_i  (spi_bitstream_valid),
        .bitstream_data_i   (spi_bitstream_data),
        
        // Configuration in progress
        .busy_o             (fabric_config_busy),
        
        // Fabric is configured
        .configured_o       (fabric_config_configured),
        
        // To the fabric
        .FrameData_o        (FrameData),
        .FrameStrobe_o      (FrameStrobe)
    );
    
    // TODO remove keep
    fabric_wrapper fabric_wrapper (
        .clk_i  (fpga_clk_i),
        
        // Configuration
        .FrameData_i    (FrameData),
        .FrameStrobe_i  (FrameStrobe),
        
        // Fabric is configured
        .configured_i   (fabric_config_configured),

        // I/Os North
        .io_north_in_i  (fabric_io_north_in_i),
        .io_north_out_o (fabric_io_north_out_o),
        .io_north_oe_o  (fabric_io_north_oe_o),

        // I/Os South
        .io_south_in_i  (fabric_io_south_in_i),
        .io_south_out_o (fabric_io_south_out_o),
        .io_south_oe_o  (fabric_io_south_oe_o)
    );
    
    //$assert(fabric_wrapper.FrameBitsPerRow ...)
    
endmodule
