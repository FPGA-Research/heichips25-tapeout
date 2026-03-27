// SPDX-FileCopyrightText: © 2026 Meinhard Kissich
// SPDX-License-Identifier: Apache-2.0

// This user design demonstrates how to implement custom FazyRV CCX
// instructions in the FPGA fabric. The interface allows returning
// the result chunks, or delaying them by an arbitrary number of cycles.
// The latter is required when, e.g., the entire operand is required
// to compute the result.
//
// Combinational:
// =============
// clk_i        : ┌─┐_┌─┐_┌─┐_┌─┐_┆┌─┐_┌─┐_┌─┐_
// ccx_req_i    : ________┌───┐___┆____________
// ccx_resp_o   : ________________┆____┌───┐___
// ccx_rs{a|b}_i: xxxxxxxx<c0><c1>┆<c6><c7>xxxx
// ccx_res_o    : xxxxxxxx<r0><r1>┆<r6><r7>xxxx
//
//
// Delayed:
// ========
// clk_i        : ┌─┐_┌─┐_┌─┐_┌─┐_┆┌─┐_┌─┐_┆┌─┐_┌─┐_┆┌─┐_┌─┐_┌─┐_
// ccx_req_i    : ________┌───┐___┆________┆________┆____________
// ccx_resp_o   : ________________┆________┆________┆____┌───┐___
// ccx_rs{a|b}_i: xxxxxxxx<c0><c1>┆<c7>xxxx┆xxxxxxxx┆xxxxxxxxxxxx
// ccx_res_o    : xxxxxxxxxxxxxxxx┆xxxxxxxx┆xxxx<r0>┆<r6><r7>xxxx
//

`default_nettype none

module fazyrv_ccx_cinsn_and_or #(parameter CHUNKSIZE=4) (
  input  wire       fazyrv_clk_i,
  input  wire       fazyrv_rst_in,
  input  wire       fazyrv_en_i,
  // xip
  inout  wire [3:0] fazyrv_qspi_sdio,
  output wire       fazyrv_qspi_sck_o,
  output wire       fazyrv_qspi_cs_rom_o,
  output wire       fazyrv_qspi_cs_ram_o,
  // spi
  input  wire       fazyrv_spi_sdi_i,
  output wire       fazyrv_spi_sdo_o,
  output wire       fazyrv_spi_sck_o,
  // gpio
  input  wire [5:0] fazyrv_gpi_i,
  output wire       fazyrv_gpo_o
);

// Connections to FazyRV hard macro
wire       fzy_clk;
wire       fzy_rst_n;
wire       fzy_en;
// ccx
wire [3:0] fzy_ccx_rs_a;
wire [3:0] fzy_ccx_rs_b;
wire [3:0] fzy_ccx_res;
wire       fzy_ccx_req;
wire       fzy_ccx_resp;
wire       fzy_ccx_sel;
// xip
wire [3:0] fzy_qspi_sdi;
wire [3:0] fzy_qspi_sdo;
wire [3:0] fzy_qspi_sdoen;
wire       fzy_qspi_sck;
wire       fzy_qspi_cs_rom;
wire       fzy_qspi_cs_ram;
// spi
wire       fzy_spi_sdi;
wire       fzy_spi_sdo;
wire       fzy_spi_sck;
// gpio
wire [5:0] fzy_gpi;
wire       fzy_gpo;


localparam RES_DLY = 1;

logic [CHUNKSIZE-1:0]                  shift_res_r [0:RES_DLY-1];
logic [(RES_DLY-1 + 32/CHUNKSIZE-1):0] shift_req_r;

always_ff @(posedge fazyrv_clk_i) begin
  if (fzy_ccx_sel)  shift_res_r[0] <= fzy_ccx_rs_a & fzy_ccx_rs_b;
  else              shift_res_r[0] <= fzy_ccx_rs_a | fzy_ccx_rs_b;

  shift_req_r[0] <= fzy_ccx_req;
end

genvar i;

generate for (i = 1; i < RES_DLY; i++) begin
  always_ff @(posedge fazyrv_clk_i) shift_res_r[i] <= shift_res_r[i-1];
end endgenerate

generate for (i = 1; i < RES_DLY + 32/CHUNKSIZE-1; i++) begin
  always_ff @(posedge fazyrv_clk_i) shift_req_r[i] <= shift_req_r[i-1];
end endgenerate

// Mappint to asic
//
assign fzy_clk   = fazyrv_clk_i;
assign fzy_rst_n = fazyrv_rst_in;
assign fzy_en    = fazyrv_en_i;

assign fzy_ccx_res  = shift_res_r[RES_DLY-1];
assign fzy_ccx_resp = shift_req_r[RES_DLY-1 + 32/CHUNKSIZE-1];

// Mapping to pcb
//
assign fazyrv_qspi_sdio[0]  = fzy_qspi_sdoen[0] ? fzy_qspi_sdo[0] : 1'bz;
assign fazyrv_qspi_sdio[1]  = fzy_qspi_sdoen[1] ? fzy_qspi_sdo[1] : 1'bz;
assign fazyrv_qspi_sdio[2]  = fzy_qspi_sdoen[2] ? fzy_qspi_sdo[2] : 1'bz;
assign fazyrv_qspi_sdio[3]  = fzy_qspi_sdoen[3] ? fzy_qspi_sdo[3] : 1'bz;
assign fazyrv_qspi_sck_o    = fzy_qspi_sck;
assign fazyrv_qspi_cs_rom_o = fzy_qspi_cs_rom;
assign fazyrv_qspi_cs_ram_o = fzy_qspi_cs_ram;

assign fzy_spi_sdi          = fazyrv_spi_sdi_i;
assign fazyrv_spi_sdo_o     = fzy_spi_sdo;
assign fazyrv_spi_sck_o     = fzy_spi_sck;

assign fzy_gpi              = fazyrv_gpi_i;
assign fazyrv_gpo_o         = fzy_gpo;


FazyRV_exotiny_wrapper i_FazyRV_exotiny_wrapper (
  .fzy_clk_i         ( fzy_clk            ),
  .fzy_rst_in        ( fzy_rst_n          ),
  .fzy_en_i          ( fzy_en             ),
  // ccx
  .fzy_ccx_rs_a_o    ( fzy_ccx_rs_a       ),
  .fzy_ccx_rs_b_o    ( fzy_ccx_rs_b       ),
  .fzy_ccx_res_i     ( fzy_ccx_res        ),
  .fzy_ccx_req_o     ( fzy_ccx_req        ),
  .fzy_ccx_resp_i    ( fzy_ccx_resp       ),
  .fzy_ccx_sel_o     ( fzy_ccx_sel        ),
  // xip
  .fzy_qspi_sdi_i    ( fzy_qspi_sdi       ),
  .fzy_qspi_sdo_o    ( fzy_qspi_sdo       ),
  .fzy_qspi_sdoen_o  ( fzy_qspi_sdoen     ),
  .fzy_qspi_sck_o    ( fzy_qspi_sck       ),
  .fzy_qspi_cs_rom_o ( fzy_qspi_cs_rom    ),
  .fzy_qspi_cs_ram_o ( fzy_qspi_cs_ram    ),
  // spi
  .fzy_spi_sdi_i     ( fzy_spi_sdi        ),
  .fzy_spi_sdo_o     ( fzy_spi_sdo        ),
  .fzy_spi_sck_o     ( fzy_spi_sck        ),
  // gpio
  .fzy_gpi_i         ( fzy_gpi            ),
  .fzy_gpo_o         ( fzy_gpo            )
);

endmodule



module FazyRV_exotiny_wrapper (
  input  logic       fzy_clk_i,
  input  logic       fzy_rst_in,
  input  logic       fzy_en_i,
  // ccx
  output logic [3:0] fzy_ccx_rs_a_o,
  output logic [3:0] fzy_ccx_rs_b_o,
  input  logic [3:0] fzy_ccx_res_i,
  output logic       fzy_ccx_req_o,
  input  logic       fzy_ccx_resp_i,
  output logic       fzy_ccx_sel_o,
  // xip
  input  logic [3:0] fzy_qspi_sdi_i,
  output logic [3:0] fzy_qspi_sdo_o,
  output logic [3:0] fzy_qspi_sdoen_o,
  output logic       fzy_qspi_sck_o,
  output logic       fzy_qspi_cs_rom_o,
  output logic       fzy_qspi_cs_ram_o,
  // spi
  input  logic       fzy_spi_sdi_i,
  output logic       fzy_spi_sdo_o,
  output logic       fzy_spi_sck_o,
  // gpio
  input  logic [5:0] fzy_gpi_i,
  output logic       fzy_gpo_o
);

  (* keep, BEL="X0Y9.A" *) TT_PROJECT i_TT_PROJECT (
    .UI_IN0   ( fzy_ccx_res_i[0]     ),
    .UI_IN1   ( fzy_ccx_res_i[1]     ),
    .UI_IN2   ( fzy_ccx_res_i[2]     ),
    .UI_IN3   ( fzy_ccx_res_i[3]     ),
    .UI_IN4   ( fzy_gpi_i[3]         ),
    .UI_IN5   ( fzy_gpi_i[4]         ),
    .UI_IN6   ( fzy_gpi_i[5]         ),
    .UI_IN7   ( fzy_spi_sdi_i        ),

    .UO_OUT0  ( fzy_ccx_rs_a_o[0]    ),
    .UO_OUT1  ( fzy_ccx_rs_a_o[1]    ),
    .UO_OUT2  ( fzy_ccx_rs_a_o[2]    ),
    .UO_OUT3  ( fzy_ccx_rs_a_o[3]    ),
    .UO_OUT4  ( fzy_ccx_rs_b_o[0]    ),
    .UO_OUT5  ( fzy_ccx_rs_b_o[1]    ),
    .UO_OUT6  ( fzy_ccx_rs_b_o[2]    ),
    .UO_OUT7  ( fzy_ccx_rs_b_o[3]    ),

    .UIO_IN0  ( fzy_qspi_sdi_i[0]    ),
    .UIO_IN1  ( fzy_qspi_sdi_i[1]    ),
    .UIO_IN2  ( fzy_qspi_sdi_i[2]    ),
    .UIO_IN3  ( fzy_qspi_sdi_i[3]    ),
    .UIO_IN4  ( fzy_ccx_resp_i       ),
    .UIO_IN5  ( fzy_gpi_i[0]         ),
    .UIO_IN6  ( fzy_gpi_i[1]         ),
    .UIO_IN7  ( fzy_gpi_i[2]         ),

    .UIO_OUT0 ( fzy_qspi_cs_rom_o    ),
    .UIO_OUT1 ( fzy_qspi_sdo_o[0]    ),
    .UIO_OUT2 ( fzy_qspi_sdo_o[1]    ),
    .UIO_OUT3 ( fzy_qspi_sck_o       ),
    .UIO_OUT4 ( fzy_qspi_sdo_o[2]    ),
    .UIO_OUT5 ( fzy_qspi_sdo_o[3]    ),
    .UIO_OUT6 ( fzy_qspi_cs_ram_o    ),
    .UIO_OUT7 ( fzy_gpo_o            ),
    
    .UIO_OE0  ( fzy_ccx_sel_o        ), // Note: not used as actual OE signal
    .UIO_OE1  ( fzy_qspi_sdoen_o[0]  ),
    .UIO_OE2  ( fzy_qspi_sdoen_o[1]  ),
    .UIO_OE3  ( fzy_qspi_sdoen_o[2]  ),
    .UIO_OE4  ( fzy_qspi_sdoen_o[3]  ),
    .UIO_OE5  ( fzy_ccx_req_o        ), // Note: not used as actual OE signal
    .UIO_OE6  ( fzy_spi_sck_o        ), // Note: not used as actual OE signal
    .UIO_OE7  ( fzy_spi_sdo_o        ), // Note: not used as actual OE signal
    
    .ENA      ( fzy_en_i             ),
    .CLK      ( fzy_clk_i            ),
    .RST_N    ( fzy_rst_in           )
  );

endmodule
