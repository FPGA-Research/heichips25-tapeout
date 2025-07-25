// SPDX-FileCopyrightText: © 2025 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

module heichips25_top (
    inout  wire         fpga_clk_PAD,
    inout  wire         fpga_rst_n_PAD,

    inout  wire         fpga_sclk_PAD,
    inout  wire         fpga_cs_n_PAD,
    inout  wire         fpga_mosi_PAD,
    inout  wire         fpga_miso_PAD,

    inout  wire         fpga_mode_PAD,
    output wire         fpga_config_busy_PAD,
    //output wire         fpga_config_configured_PAD,
    //input  wire [3:0]   fpga_config_slot_PAD,
    //input  wire         fpga_config_trigger_PAD,

    inout  wire [31:0]  fpga_io_PAD
);
    // FPGA
    wire fpga_clk_PAD2CORE;
    wire fpga_rst_n_PAD2CORE;

    wire fpga_sclk_CORE2PAD;
    wire fpga_sclk_CORE2PAD_EN;
    wire fpga_sclk_PAD2CORE;

    wire fpga_cs_n_CORE2PAD;
    wire fpga_cs_n_CORE2PAD_EN;
    wire fpga_cs_n_PAD2CORE;

    wire fpga_mosi_CORE2PAD;
    wire fpga_mosi_CORE2PAD_EN;
    wire fpga_mosi_PAD2CORE;

    wire fpga_miso_CORE2PAD;
    wire fpga_miso_CORE2PAD_EN;
    wire fpga_miso_PAD2CORE;
    
    wire fpga_mode_PAD2CORE;
    
    wire fpga_config_busy_CORE2PAD;

    wire [31:0] fpga_io_PAD2CORE;
    wire [31:0] fpga_io_CORE2PAD;
    wire [31:0] fpga_io_CORE2PAD_EN;

    // Power/Ground IO pad instances
    
    (* keep *)
    sg13g2_IOPadVdd sg13g2_IOPadVdd_east ();

    (* keep *)
    sg13g2_IOPadVss sg13g2_IOPadVss_east ();

    (* keep *)
    sg13g2_IOPadIOVss sg13g2_IOPadIOVss_east ();

    (* keep *)
    sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_east ();

    (* keep *)
    sg13g2_IOPadVdd sg13g2_IOPadVdd_west ();

    (* keep *)
    sg13g2_IOPadVss sg13g2_IOPadVss_west ();

    (* keep *)
    sg13g2_IOPadIOVss sg13g2_IOPadIOVss_west ();

    (* keep *)
    sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_west ();

    // FPGA IO pad instances

    sg13g2_IOPadIn sg13g2_IOPadIn_fpga_clk (
        .p2c (fpga_clk_PAD2CORE),
        .pad (fpga_clk_PAD)
    );
    
    sg13g2_IOPadIn sg13g2_IOPadIn_fpga_rst_n (
        .p2c (fpga_rst_n_PAD2CORE),
        .pad (fpga_rst_n_PAD)
    );

    sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_fpga_sclk (
        .c2p    (fpga_sclk_CORE2PAD),
        .c2p_en (fpga_sclk_CORE2PAD_EN),
        .p2c    (fpga_sclk_PAD2CORE),
        .pad    (fpga_sclk_PAD )
    );
    
    sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_fpga_cs_n (
        .c2p    (fpga_cs_n_CORE2PAD),
        .c2p_en (fpga_cs_n_CORE2PAD_EN),
        .p2c    (fpga_cs_n_PAD2CORE),
        .pad    (fpga_cs_n_PAD )
    );
    
    sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_fpga_mosi (
        .c2p    (fpga_mosi_CORE2PAD),
        .c2p_en (fpga_mosi_CORE2PAD_EN),
        .p2c    (fpga_mosi_PAD2CORE),
        .pad    (fpga_mosi_PAD )
    );
    
    sg13g2_IOPadInOut30mA sg13g2_IOPadInOut30mA_fpga_miso (
        .c2p    (fpga_miso_CORE2PAD),
        .c2p_en (fpga_miso_CORE2PAD_EN),
        .p2c    (fpga_miso_PAD2CORE),
        .pad    (fpga_miso_PAD )
    );

    sg13g2_IOPadIn sg13g2_IOPadIn_fpga_mode (
        .p2c (fpga_mode_PAD2CORE),
        .pad (fpga_mode_PAD)
    );
    
    sg13g2_IOPadOut30mA sg13g2_IOPadOut30mA_fpga_config_busy (
        .c2p (fpga_config_busy_CORE2PAD),
        .pad (fpga_config_busy_PAD)
    );
    
    generate
    for (genvar i=0; i<32; i++) begin : sg13g2_IOPadInOut30mA_fpga_io
        sg13g2_IOPadInOut30mA fpga_io (
            .c2p    (fpga_io_CORE2PAD[i]),
            .c2p_en (fpga_io_CORE2PAD_EN[i]),
            .p2c    (fpga_io_PAD2CORE[i]),
            .pad    (fpga_io_PAD[i])
        );
    end
    endgenerate

    // TODO synchronize reset deassert!

    wire [32-1:0] fabric_io_in_i;
    wire [32-1:0] fabric_io_out_o;
    wire [32-1:0] fabric_io_oe_o;

    // Core
    heichips25_core heichips25_core (
        // FPGA
        .fpga_clk_i     (fpga_clk_PAD2CORE),
        .fpga_rst_ni    (fpga_rst_n_PAD2CORE),

        .fpga_sclk_i    (fpga_sclk_PAD2CORE),
        .fpga_sclk_o    (fpga_sclk_CORE2PAD),
        .fpga_sclk_en_o (fpga_sclk_CORE2PAD_EN),
        
        .fpga_cs_n_i    (fpga_cs_n_PAD2CORE),
        .fpga_cs_n_o    (fpga_cs_n_CORE2PAD),
        .fpga_cs_n_en_o (fpga_cs_n_CORE2PAD_EN),
        
        .fpga_mosi_i    (fpga_mosi_PAD2CORE),
        .fpga_mosi_o    (fpga_mosi_CORE2PAD),
        .fpga_mosi_en_o (fpga_mosi_CORE2PAD_EN),
        
        .fpga_miso_i    (fpga_miso_PAD2CORE),
        .fpga_miso_o    (fpga_miso_CORE2PAD),
        .fpga_miso_en_o (fpga_miso_CORE2PAD_EN),

        .fpga_mode_i    (fpga_mode_PAD2CORE),
        .fpga_config_busy_o (fpga_config_busy_CORE2PAD),

        // I/Os FPGA
        .fabric_io_in_i     (fpga_io_PAD2CORE),
        .fabric_io_out_o    (fpga_io_CORE2PAD),
        .fabric_io_oe_o     (fpga_io_CORE2PAD_EN)
    );

endmodule
