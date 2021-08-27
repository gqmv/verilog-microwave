`include "level2/timer.v"
`include "level2/encoder.v"
`include "level2/control.v"
`include "level2/seg7_driver.v"
module controler(
    input wire [9:0] keypad,
    input wire clk,
    
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,

    output wire seconds_ones_out,
    output wire seconds_tens_out,
    output wire minutes_out,

    output wire mag_on
);

wire en, pgt_1Hz, loadn, timer_done;
wire [3:0] D, seconds_ones, seconds_tens, minutes;

encoder encoder_inst(.numpad(keypad), .enable(mag_on), .clk(clk), .D(D), .loadn(loadn), .pgt_1Hz(pgt_1Hz));

timer timer_inst(.digit(D), .clearn(clearn), .enable(mag_on), .loadn(loadn), .CLK(pgt_1Hz), .minutes(minutes), .secs(seconds_ones_out), .tens_secs(seconds_tens_out), .timer_done(timer_done));

control control_inst(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .mag_on(mag_on));

seg7_driver seg7_driver_inst(.seconds_ones(seconds_ones_out), .seconds_tens(seconds_tens_out), .minutes(minutes_out), .seconds_ones_out(seconds_ones_out), .seconds_tens_out(seconds_tens_out), .minutes_out(minutes_out));

endmodule