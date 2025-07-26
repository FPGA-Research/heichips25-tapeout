module top(
    input  wire        clk,
    input  wire [`NUM_IO-1:0] io_in,
    output wire [`NUM_IO-1:0] io_out,
    output wire [`NUM_IO-1:0] io_oeb
);

    logic [7:0] uio_oe;

    // Top left
    (* keep, BEL="X0Y1" *) TT_PROJECT_wrapper TT_PROJECT_wrapper (
        .UI_IN      (io_in[7:0]),
        .UO_OUT     (io_out[15:8]),
        .UIO_IN     (io_in[23:16]),
        .UIO_OUT    (io_out[23:16]),
        .UIO_OE     (uio_oe),
        .ENA        (1'b1),
        .RST_N      (1'b0)
    );
    
    assign io_out[7:0] = '0;
    assign io_out[`NUM_IO-1:24] = '0;

    assign io_oeb[7:0] = '1; // input
    assign io_oeb[15:8] = '0; // output
    assign io_oeb[23:16] = ~uio_oe; // inout
    assign io_oeb[`NUM_IO-1:24] = '1;
    
    /*(* keep, BEL="X0Y1" *) TT_PROJECT_wrapper TT_PROJECT_wrapper (
        .UI_IN      ('0),
        .UO_OUT     (),
        .UIO_IN     ('0),
        .UIO_OUT    (),
        .UIO_OE     (),
        .ENA        (1'b1),
        .RST_N      (1'b0)
    );*/

endmodule
