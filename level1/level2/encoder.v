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
    input wire enablen,
    input wire clk,
    output wire [3:0] D,
    output wire loadn,
    output wire pgt_1Hz
);

    wire mux_d0, mux_d1;
    reg numpad_pressed;

    initial numpad_pressed = 0;

    always @(numpad) begin
        if(numpad == 10'b00000_00000)
            numpad_pressed <= 0;
        else
            numpad_pressed <= 1;
    end

    assign loadn = ~numpad_pressed;

    encoder_dec_bcd dec_to_bcd(.decimal(numpad), .enablen(enablen), .bcd(D));
    counter0_7 debouncer(.clk(clk), .numpad_pressed(numpad_pressed), .out(mux_d0));
    counterdiv100 div100(.clk(clk), .clk_out(mux_d1));
    mux2_1 mux(.selector(enablen), .d0(mux_d0), .d1(mux_d1), .out(pgt_1Hz));


endmodule