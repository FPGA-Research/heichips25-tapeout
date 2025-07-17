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

    input  logic fpga_mode_i,

    // Tiny Tapeout
    input  logic tt_clk_i,
    input  logic tt_rst_n_i,

    input  logic [7:0] tt_ui_in,
    output logic [7:0] tt_uo_out,
    input  logic [7:0] tt_uio_in,
    output logic [7:0] tt_uio_out,
    output logic [7:0] tt_uio_oe
);
    logic unused;
    always @(posedge fpga_clk_i) begin
        unused <= fpga_rst_ni ^ fpga_sclk_i ^ fpga_cs_n_i ^ fpga_mosi_i ^ fpga_miso_i ^ fpga_mode_i ^ tt_clk_i ^ tt_rst_n_i ^ (^tt_ui_in) ^ (^tt_uio_in);
    end


    assign fpga_sclk_o = unused;
    assign fpga_sclk_en_o = '0;
    
    assign fpga_cs_n_o = '0;
    assign fpga_cs_n_en_o = '0;
    
    assign fpga_mosi_o = '0;
    assign fpga_mosi_en_o = '0;
    
    assign fpga_miso_o = '0;
    assign fpga_miso_en_o = '0;

    assign tt_uo_out = tt_ui_in;

    assign tt_uio_out = '0;
    assign tt_uio_oe = '0;

endmodule
