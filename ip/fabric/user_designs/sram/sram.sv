module top(
    input  wire        clk,
    input  wire [`NUM_IO-1:0] io_in,
    output wire [`NUM_IO-1:0] io_out,
    output wire [`NUM_IO-1:0] io_oeb
);

    wire [31:0] sram_do;

    IHP_SRAM_1024x32_wrapper sram0 (
        .ADDR    (io_in[25:16]),
        .BM      (32'hFFFFFFFF),
        .DIN     ({16'd0, io_in[15:0]}),
        .WEN     (io_in[30]),
        .MEN     (io_in[26]),
        .REN     (io_in[31]),
        .DOUT    (sram_do)
    );

    assign io_out = sram_do;

endmodule
