/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

(* noblackbox *)
module heichips25_template (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n - low to reset
    
    // Dedicated pins
    output wire usb_dp_en_o,
    input  wire usb_dp_rx_i,
    output wire usb_dp_tx_o,

    output wire usb_dn_en_o,
    input  wire usb_dn_rx_i,
    output wire usb_dn_tx_o,
    
    output wire usb_dp_up_o
);

endmodule
