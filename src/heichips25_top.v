// SPDX-FileCopyrightText: © 2025 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

module heichips25_top #(
    // Power/ground pads for core
    parameter NUM_VDD_PADS = 6,
    parameter NUM_VSS_PADS = 6,
    
    // Power/ground pads for I/O
    parameter NUM_IOVDD_PADS = 6,
    parameter NUM_IOVSS_PADS = 6
    )(
    `ifdef USE_POWER_PINS
    inout wire VDD,
    inout wire VSS,
    inout wire IOVDD,
    inout wire IOVSS,
    `endif

    inout  wire         fpga_clk_PAD,
    inout  wire         fpga_rst_n_PAD,

    inout  wire         fpga_sclk_PAD,
    inout  wire         fpga_cs_n_PAD,
    inout  wire         fpga_mosi_PAD,
    inout  wire         fpga_miso_PAD,

    inout  wire         fpga_mode_PAD,
    inout  wire         fpga_config_busy_PAD,
    inout  wire         fpga_config_configured_PAD,
    inout  wire [3:0]   fpga_config_slot_PAD,
    inout  wire         fpga_config_trigger_PAD,

    inout  wire [31:0]  fpga_io_PAD,
    
    // User I/Os
    inout  wire         user_usb_dn_PAD,
    inout  wire         user_usb_dp_PAD,
    inout  wire         user_usb_dp_up_PAD,
    
    inout  wire         user_tmds_b_PAD,
    inout  wire         user_tmds_g_PAD,
    inout  wire         user_tmds_r_PAD,
    inout  wire         user_tmds_clk_PAD,
    
    inout  wire         icelab_analog_pin0_PAD,
    inout  wire         icelab_analog_pin1_PAD,
    inout  wire         icelab_analog_pin2_PAD,
    inout  wire         icelab_analog_pin3_PAD,
    
    inout  wire         internal_analog_pin0_PAD,
    inout  wire         internal_analog_pin1_PAD,
    inout  wire         internal_analog_pin2_PAD,
    
    inout  wire         pudding_i_in_PAD,
    inout  wire         pudding_i_out_PAD,
    
    inout  wire         ethernet_dp_PAD,
    inout  wire         ethernet_dn_PAD
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
    
    wire        fpga_mode_PAD2CORE;
    wire        fpga_config_busy_CORE2PAD;
    wire        fpga_config_configured_CORE2PAD;
    wire [3:0]  fpga_config_slot_PAD2CORE;
    wire        fpga_config_trigger_PAD2CORE;

    wire [31:0] fpga_io_PAD2CORE;
    wire [31:0] fpga_io_CORE2PAD;
    wire [31:0] fpga_io_CORE2PAD_EN;

    wire icelab_analog_pin0_PADRES;
    wire icelab_analog_pin1_PADRES;
    wire icelab_analog_pin2_PADRES;
    wire icelab_analog_pin3_PADRES;

    wire internal_analog_pin0_PADRES;
    wire internal_analog_pin1_PADRES;
    wire internal_analog_pin2_PADRES;

    wire pudding_i_in_PADRES;
    wire pudding_i_out_PADBARE;

    wire ethernet_dp_PADBARE;
    wire ethernet_dn_PADBARE;

    // Power/ground pad instances

    generate
    for (genvar i=0; i<NUM_IOVDD_PADS; i++) begin : iovdd_pads
        (* keep *)
        sg13g2_IOPadIOVdd iovdd_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    for (genvar i=0; i<NUM_IOVSS_PADS; i++) begin : iovss_pads
        (* keep *)
        sg13g2_IOPadIOVss iovss_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    for (genvar i=0; i<NUM_VDD_PADS; i++) begin : vdd_pads
        (* keep *)
        sg13g2_IOPadVdd vdd_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    for (genvar i=0; i<NUM_VSS_PADS; i++) begin : vss_pads
        (* keep *)
        sg13g2_IOPadVss vss_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    endgenerate

    // FPGA IO pad instances

    sg13g2_IOPadIn fpga_clk (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .p2c (fpga_clk_PAD2CORE),
        .pad (fpga_clk_PAD)
    );
    
    sg13g2_IOPadIn fpga_rst_n (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .p2c (fpga_rst_n_PAD2CORE),
        .pad (fpga_rst_n_PAD)
    );

    sg13g2_IOPadInOut30mA fpga_sclk (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p    (fpga_sclk_CORE2PAD),
        .c2p_en (fpga_sclk_CORE2PAD_EN),
        .p2c    (fpga_sclk_PAD2CORE),
        .pad    (fpga_sclk_PAD )
    );
    
    sg13g2_IOPadInOut30mA fpga_cs_n (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p    (fpga_cs_n_CORE2PAD),
        .c2p_en (fpga_cs_n_CORE2PAD_EN),
        .p2c    (fpga_cs_n_PAD2CORE),
        .pad    (fpga_cs_n_PAD )
    );
    
    sg13g2_IOPadInOut30mA fpga_mosi (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p    (fpga_mosi_CORE2PAD),
        .c2p_en (fpga_mosi_CORE2PAD_EN),
        .p2c    (fpga_mosi_PAD2CORE),
        .pad    (fpga_mosi_PAD )
    );
    
    sg13g2_IOPadInOut30mA fpga_miso (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p    (fpga_miso_CORE2PAD),
        .c2p_en (fpga_miso_CORE2PAD_EN),
        .p2c    (fpga_miso_PAD2CORE),
        .pad    (fpga_miso_PAD )
    );

    sg13g2_IOPadIn fpga_mode (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .p2c (fpga_mode_PAD2CORE),
        .pad (fpga_mode_PAD)
    );
    
    sg13g2_IOPadOut30mA fpga_config_busy (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p (fpga_config_busy_CORE2PAD),
        .pad (fpga_config_busy_PAD)
    );
    
    generate
    for (genvar i=0; i<32; i++) begin : fpga_ios
        sg13g2_IOPadInOut30mA fpga_io (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS),
            `endif
            .c2p    (fpga_io_CORE2PAD[i]),
            .c2p_en (fpga_io_CORE2PAD_EN[i]),
            .p2c    (fpga_io_PAD2CORE[i]),
            .pad    (fpga_io_PAD[i])
        );
    end
    endgenerate

    sg13g2_IOPadOut30mA fpga_config_configured (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p (fpga_config_configured_CORE2PAD),
        .pad (fpga_config_configured_PAD)
    );

    generate
    for (genvar i=0; i<4; i++) begin : fpga_config_slot
        sg13g2_IOPadIn fpga_config_slot (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS),
            `endif
            .p2c (fpga_config_slot_PAD2CORE[i]),
            .pad (fpga_config_slot_PAD[i])
        );
    end
    endgenerate

    sg13g2_IOPadIn fpga_config_trigger (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .p2c (fpga_config_trigger_PAD2CORE),
        .pad (fpga_config_trigger_PAD)
    );
    
    // I/Os for the user projects
    
    wire user_usb_dn_CORE2PAD;
    wire user_usb_dn_CORE2PAD_EN;
    wire user_usb_dn_PAD2CORE;
    
    sg13g2_IOPadInOut30mA user_usb_dn (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p    (user_usb_dn_CORE2PAD),
        .c2p_en (user_usb_dn_CORE2PAD_EN),
        .p2c    (user_usb_dn_PAD2CORE),
        .pad    (user_usb_dn_PAD )
    );

    wire user_usb_dp_CORE2PAD;
    wire user_usb_dp_CORE2PAD_EN;
    wire user_usb_dp_PAD2CORE;
    
    sg13g2_IOPadInOut30mA user_usb_dp (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p    (user_usb_dp_CORE2PAD),
        .c2p_en (user_usb_dp_CORE2PAD_EN),
        .p2c    (user_usb_dp_PAD2CORE),
        .pad    (user_usb_dp_PAD )
    );

    wire user_usb_dp_up_CORE2PAD;

    sg13g2_IOPadOut30mA user_usb_dp_up (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p (user_usb_dp_up_CORE2PAD),
        .pad (user_usb_dp_up_PAD)
    );

    wire user_tmds_b_CORE2PAD;
    wire user_tmds_g_CORE2PAD;
    wire user_tmds_r_CORE2PAD;
    wire user_tmds_clk_CORE2PAD;

    sg13g2_IOPadOut30mA user_tmds_b (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p (user_tmds_b_CORE2PAD),
        .pad (user_tmds_b_PAD)
    );

    sg13g2_IOPadOut30mA user_tmds_g (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p (user_tmds_g_CORE2PAD),
        .pad (user_tmds_g_PAD)
    );

    sg13g2_IOPadOut30mA user_tmds_r (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p (user_tmds_r_CORE2PAD),
        .pad (user_tmds_r_PAD)
    );

    sg13g2_IOPadOut30mA user_tmds_clk (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .c2p (user_tmds_clk_CORE2PAD),
        .pad (user_tmds_clk_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog icelab_analog_pin0 (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (icelab_analog_pin0_PADRES),
        .pad (icelab_analog_pin0_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog icelab_analog_pin1 (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (icelab_analog_pin1_PADRES),
        .pad (icelab_analog_pin1_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog icelab_analog_pin2 (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (icelab_analog_pin2_PADRES),
        .pad (icelab_analog_pin2_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog icelab_analog_pin3 (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (icelab_analog_pin3_PADRES),
        .pad (icelab_analog_pin3_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog internal_analog_pin0 (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (internal_analog_pin0_PADRES),
        .pad (internal_analog_pin0_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog internal_analog_pin1 (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (internal_analog_pin1_PADRES),
        .pad (internal_analog_pin1_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog internal_analog_pin2 (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (internal_analog_pin2_PADRES),
        .pad (internal_analog_pin2_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog pudding_i_in (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padres (pudding_i_in_PADRES),
        .pad (pudding_i_in_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog pudding_i_out (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padbare (pudding_i_out_PADBARE),
        .pad (pudding_i_out_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog ethernet_dp (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padbare (ethernet_dp_PADBARE),
        .pad (ethernet_dp_PAD)
    );

    (* keep *) sg13g2_IOPadAnalog ethernet_dn (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .padbare (ethernet_dn_PADBARE),
        .pad (ethernet_dn_PAD)
    );

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

        .fpga_mode_i                (fpga_mode_PAD2CORE),
        .fpga_config_busy_o         (fpga_config_busy_CORE2PAD),
        .fpga_config_configured_o   (fpga_config_configured_CORE2PAD),
        .fpga_config_slot_i         (fpga_config_slot_PAD2CORE),
        .fpga_config_trigger_i      (fpga_config_trigger_PAD2CORE),

        // I/Os FPGA
        .fabric_io_in_i     (fpga_io_PAD2CORE),
        .fabric_io_out_o    (fpga_io_CORE2PAD),
        .fabric_io_oe_o     (fpga_io_CORE2PAD_EN),

        // User I/Os
        .usb_dn_en_o    (user_usb_dn_CORE2PAD_EN),
        .usb_dn_rx_i    (user_usb_dn_PAD2CORE),
        .usb_dn_tx_o    (user_usb_dn_CORE2PAD),
        .usb_dp_en_o    (user_usb_dp_CORE2PAD_EN),
        .usb_dp_rx_i    (user_usb_dp_PAD2CORE),
        .usb_dp_tx_o    (user_usb_dp_CORE2PAD),
        .usb_dp_up_o    (user_usb_dp_up_CORE2PAD),
        
        .tmds_b         (user_tmds_b_CORE2PAD),
        .tmds_g         (user_tmds_g_CORE2PAD),
        .tmds_r         (user_tmds_r_CORE2PAD),
        .tmds_clk       (user_tmds_clk_CORE2PAD),
        
        .icelab_analog_pin0   (icelab_analog_pin0_PADRES),
        .icelab_analog_pin1   (icelab_analog_pin1_PADRES),
        .icelab_analog_pin2   (icelab_analog_pin2_PADRES),
        .icelab_analog_pin3   (icelab_analog_pin3_PADRES),
 
        .internal_analog_pin0 (internal_analog_pin0_PADRES),
        .internal_analog_pin1 (internal_analog_pin1_PADRES),
        .internal_analog_pin2  (internal_analog_pin2_PADRES),
        
        .pudding_i_in    (pudding_i_in_PADRES),
        .pudding_i_out   (pudding_i_out_PADBARE),

        .ethernet_dp    (ethernet_dp_PADBARE),
        .ethernet_dn    (ethernet_dn_PADBARE)
    );

    // Alignment marks for bonding
    (* keep *) alignment_mark alignment_mark_0 ();
    (* keep *) alignment_mark alignment_mark_1 ();
    (* keep *) alignment_mark alignment_mark_2 ();
    (* keep *) alignment_mark alignment_mark_3 ();

    // Logos
    (* keep *) logo_heichips logo_heichips ();
    (* keep *) logo_fabulous logo_fabulous ();
    (* keep *) logo_credits logo_credits ();

endmodule
