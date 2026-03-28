// SPDX-FileCopyrightText: © 2025 Leo Moser <leo.moser@pm.me>
// SPDX-License-Identifier: Apache-2.0

module heichips25_top_tb;

    `ifdef USE_POWER_PINS
    wire VDD;
    wire VSS;
    wire IOVDD;
    wire IOVSS;
    `endif

    wire         fpga_clk_PAD;
    wire         fpga_rst_n_PAD;

    wire         fpga_sclk_PAD;
    wire         fpga_cs_n_PAD;
    wire         fpga_mosi_PAD;
    wire         fpga_miso_PAD;

    wire         fpga_mode_PAD;
    wire         fpga_config_busy_PAD;
    wire         fpga_config_configured_PAD;
    wire [3:0]   fpga_config_slot_PAD;
    wire         fpga_config_trigger_PAD;

    wire [31:0]  fpga_io_PAD;
    
    // User I/Os
    wire         user_usb_dn_PAD;
    wire         user_usb_dp_PAD;
    wire         user_usb_dp_up_PAD;
    
    wire         user_tmds_b_PAD;
    wire         user_tmds_g_PAD;
    wire         user_tmds_r_PAD;
    wire         user_tmds_clk_PAD;
    
    wire         icelab_analog_pin0_PAD;
    wire         icelab_analog_pin1_PAD;
    wire         icelab_analog_pin2_PAD;
    wire         icelab_analog_pin3_PAD;
    
    wire         internal_analog_pin0_PAD;
    wire         internal_analog_pin1_PAD;
    wire         internal_analog_pin2_PAD;
    
    wire         pudding_i_in_PAD;
    wire         pudding_i_out_PAD;
    
    wire         ethernet_dp_PAD;
    wire         ethernet_dn_PAD;
    
    wire fpga_io_PAD_0;
    wire fpga_io_PAD_1;
    wire fpga_io_PAD_2;
    wire fpga_io_PAD_3;
    wire fpga_io_PAD_4;
    wire fpga_io_PAD_5;
    wire fpga_io_PAD_6;
    wire fpga_io_PAD_7;
    wire fpga_io_PAD_8;
    wire fpga_io_PAD_9;
    wire fpga_io_PAD_10;
    wire fpga_io_PAD_11;
    wire fpga_io_PAD_12;
    wire fpga_io_PAD_13;
    wire fpga_io_PAD_14;
    wire fpga_io_PAD_15;
    wire fpga_io_PAD_16;
    wire fpga_io_PAD_17;
    wire fpga_io_PAD_18;
    wire fpga_io_PAD_19;
    wire fpga_io_PAD_20;
    wire fpga_io_PAD_21;
    wire fpga_io_PAD_22;
    wire fpga_io_PAD_23;
    wire fpga_io_PAD_24;
    wire fpga_io_PAD_25;
    wire fpga_io_PAD_26;
    wire fpga_io_PAD_27;
    wire fpga_io_PAD_28;
    wire fpga_io_PAD_29;
    wire fpga_io_PAD_30;
    wire fpga_io_PAD_31;

    `ifdef BITSTREAM_FLASH
    
    // SPI Flash - Bitstream
    spiflash_powered i_spiflash_powered (
	    .csb (fpga_cs_n_PAD),
	    .clk (fpga_sclk_PAD),
	    .io0 (fpga_mosi_PAD), // MOSI
	    .io1 (fpga_miso_PAD), // MISO
	    .io2 (  ),
	    .io3 (  )
    );
    
    // Pull down z to 0
    //assign (pull1, pull0) fpga_miso_PAD = 1'b0;
    
    `else

    //assign fpga_cs_n_PAD = 1'b1;
    //assign fpga_sclk_PAD = 1'b0;
    //assign fpga_mosi_PAD = 1'b0;
    
    // Required for GL simulation
    pullup(fpga_cs_n_PAD);
    pulldown(fpga_sclk_PAD);

    `endif

    heichips25_top heichips25_top (
      `ifdef USE_POWER_PINS
      .VDD,
      .VSS,
      .IOVDD,
      .IOVSS,
      `endif

      .fpga_clk_PAD,
      .fpga_rst_n_PAD,

      .fpga_sclk_PAD,
      .fpga_cs_n_PAD,
      .fpga_mosi_PAD,
      .fpga_miso_PAD,

      .fpga_mode_PAD,
      .fpga_config_busy_PAD,
      .fpga_config_configured_PAD,
      .fpga_config_slot_PAD,
      .fpga_config_trigger_PAD,

      .fpga_io_PAD ({fpga_io_PAD_31, fpga_io_PAD_30, fpga_io_PAD_29, fpga_io_PAD_28, fpga_io_PAD_27, fpga_io_PAD_26, fpga_io_PAD_25, fpga_io_PAD_24, fpga_io_PAD_23, fpga_io_PAD_22, fpga_io_PAD_21, fpga_io_PAD_20, fpga_io_PAD_19, fpga_io_PAD_18, fpga_io_PAD_17, fpga_io_PAD_16, fpga_io_PAD_15, fpga_io_PAD_14, fpga_io_PAD_13, fpga_io_PAD_12, fpga_io_PAD_11, fpga_io_PAD_10, fpga_io_PAD_9, fpga_io_PAD_8, fpga_io_PAD_7, fpga_io_PAD_6, fpga_io_PAD_5, fpga_io_PAD_4, fpga_io_PAD_3, fpga_io_PAD_2, fpga_io_PAD_1, fpga_io_PAD_0}),
      
      // User I/Os
      .user_usb_dn_PAD,
      .user_usb_dp_PAD,
      .user_usb_dp_up_PAD,
            
      .user_tmds_b_PAD,
      .user_tmds_g_PAD,
      .user_tmds_r_PAD,
      .user_tmds_clk_PAD,
            
      .icelab_analog_pin0_PAD,
      .icelab_analog_pin1_PAD,
      .icelab_analog_pin2_PAD,
      .icelab_analog_pin3_PAD,
            
      .internal_analog_pin0_PAD,
      .internal_analog_pin1_PAD,
      .internal_analog_pin2_PAD,
            
      .pudding_i_in_PAD,
      .pudding_i_out_PAD,
            
      .ethernet_dp_PAD,
      .ethernet_dn_PAD
  );

endmodule
