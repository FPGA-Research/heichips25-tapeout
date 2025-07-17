module top(
    input  wire        clk,
    input  wire [23:0] io_in,
    output wire [23:0] io_out,
    output wire [23:0] io_oeb
);

    wire [31:0] RS1;
    wire [31:0] RS2;
    wire [31:0] RESULT;

    xif_wrapper i_xif_wrapper (
        .RS1,
        .RS2,
        .RESULT
    );
    
    assign RESULT = RS1 + RS2;

endmodule
