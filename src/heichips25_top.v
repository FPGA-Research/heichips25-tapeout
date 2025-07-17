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

    inout  wire         tt_clk_PAD,
    inout  wire         tt_rst_n_PAD,
    inout  wire [7:0]   tt_ui_PAD,
    inout  wire [7:0]   tt_uo_PAD,
    inout  wire [7:0]   tt_uio_PAD
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

    // Tiny Tapeout
    wire       tt_clk_PAD2CORE;
    wire       tt_rst_n_PAD2CORE;

    wire [7:0] tt_ui_PAD2CORE;
    wire [7:0] tt_uo_CORE2PAD;
    wire [7:0] tt_uio_PAD2CORE;
    wire [7:0] tt_uio_CORE2PAD;
    wire [7:0] tt_uio_CORE2PAD_EN;

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

    // Tiny Tapeout IO pad instances

    sg13g2_IOPadIn sg13g2_IOPadIn_tt_clk (
        .p2c (tt_clk_PAD2CORE),
        .pad (tt_clk_PAD)
    );

    sg13g2_IOPadIn sg13g2_IOPadIn_tt_rst_n (
        .p2c (tt_rst_n_PAD2CORE),
        .pad (tt_rst_n_PAD)
    );

    generate
    for (genvar i=0; i<8; i++) begin : sg13g2_IOPadIn_tt_ui
        sg13g2_IOPadIn tt_ui (
            .p2c (tt_ui_PAD2CORE[i]),
            .pad (tt_ui_PAD[i])
        );
    end
    endgenerate

    generate
    for (genvar i=0; i<8; i++) begin : sg13g2_IOPadOut30mA_tt_uo
        sg13g2_IOPadOut30mA tt_uo (
            .c2p (tt_uo_CORE2PAD[i]),
            .pad (tt_uo_PAD[i])
        );
    end
    endgenerate
    
    generate
    for (genvar i=0; i<8; i++) begin : sg13g2_IOPadInOut30mA_tt_uio
        sg13g2_IOPadInOut30mA tt_uio (
            .c2p    (tt_uio_CORE2PAD[i]),
            .c2p_en (tt_uio_CORE2PAD_EN[i]),
            .p2c    (tt_uio_PAD2CORE[i]),
            .pad    (tt_uio_PAD[i])
        );
    end
    endgenerate

    // Core
    (* keep *) heichips25_core heichips25_core (
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

        // Tiny Tapeout
        .tt_clk_i       (tt_clk_PAD2CORE),
        .tt_rst_n_i     (tt_rst_n_PAD2CORE),

        .tt_ui_in       (tt_ui_PAD2CORE),
        .tt_uo_out      (tt_uo_CORE2PAD),
        .tt_uio_in      (tt_uio_PAD2CORE),
        .tt_uio_out     (tt_uio_CORE2PAD),
        .tt_uio_oe      (tt_uio_CORE2PAD_EN)
    );

endmodule
