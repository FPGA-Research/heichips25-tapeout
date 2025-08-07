module top(
    input  wire        clk,
    input  wire [`NUM_IO-1:0] io_in,
    output wire [`NUM_IO-1:0] io_out,
    output wire [`NUM_IO-1:0] io_oeb
);

    logic [7:0] ui_in;
    logic [7:0] uo_out;
    logic [7:0] uio_in;
    logic [7:0] uio_out;
    logic [7:0] uio_oe;
    logic       rst_n;

    // Top left user project at (X0Y1)
    // Change the coordinates under primitive_wrappers.v
    TT_PROJECT_wrapper TT_PROJECT_wrapper (
        .UI_IN      (ui_in),
        .UO_OUT     (uo_out),
        .UIO_IN     (uio_in),
        .UIO_OUT    (uio_out),
        .UIO_OE     (uio_oe),
        .ENA        (1'b1),
        .RST_N      (rst_n)
    );

    logic [ 9:0] sram_addr;
    logic [31:0] sram_bm;
    logic [31:0] sram_din;
    logic        sram_wen;
    logic        sram_men;
    logic        sram_ren;
    logic [31:0] sram_dout;
    
    IHP_SRAM_1024x32_wrapper IHP_SRAM_1024x32_wrapper (
        .ADDR  (sram_addr),
        .BM    (sram_bm),
        .DIN   (sram_din),
        .WEN   (sram_wen),
        .MEN   (sram_men),
        .REN   (sram_ren),
        .DOUT  (sram_dout)
    );
    
    // Assignments
    // - do random stuff
    
    assign rst_n = io_in[0];
    
    assign sram_addr = {2'b0, uo_out};
    assign sram_bm = {{8{uio_out[3]}}, {8{uio_out[2]}}, {8{uio_out[1]}}, {8{uio_out[0]}}};
    assign sram_din = uo_out;
    assign sram_wen = uio_out[4];
    assign sram_men = 1'b1;
    assign sram_ren = uio_out[5];
    
    assign ui_in = sram_dout[7:0];
    assign uio_in = sram_dout[15:8];
    assign io_out[16:1] = sram_dout[31:16];
    
    assign io_out[18:17] = uio_out[7:6];
    assign io_out[27:19] = uio_oe;
    assign io_out[31:28] = '0;
    
    assign io_oeb[0] = '1; // input
    assign io_oeb[31:1] = '0; // output

endmodule
