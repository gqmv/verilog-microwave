`include "level2/level3/encoder_dec_bcd.v"
`include "level2/level3/counter0_7.v"
`include "level2/level3/counterdiv100.v"
`include "level2/level3/mux2_1.v"
//`include "level3/encoder_dec_bcd.v"
//`include "level3/counter0_7.v"
//`include "level3/counterdiv100.v"
//`include "level3/mux2_1.v"

module encoder(
    input wire [9:0] numpad,
    input wire enable,
    input wire clk,
    output wire [3:0] D,
    output wire loadn,
    output wire pgt_1Hz
);

    wire clr, mux_d0, mux_d1;

    encoder_dec_bcd dec_to_bcd(.decimal(numpad), .enable(enable), .bcd(D), .loadn(loadn));
    counter0_7 debouncer(.clk(clk), .clear(loadn), .out(mux_d0));
    counterdiv100 div100(.clk(clk), .clk_out(mux_d1));
    mux2_1 mux(.selector(enable), .d0(mux_d0), .d1(mux_d1), .out(pgt_1Hz));

    assign loadn = clr;

endmodule