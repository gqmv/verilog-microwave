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

    output wire [6:0] seconds_ones_out,
    output wire [6:0] seconds_tens_out,
    output wire [6:0] minutes_out,

    output wire mag_on
);

wire en, pgt_1Hz, loadn, timer_done;
wire [3:0] D, seconds_ones, seconds_tens, minutes;

encoder encoder_inst(.numpad(keypad), .enablen(mag_on), .clk(clk), .D(D), .loadn(loadn), .pgt_1Hz(pgt_1Hz));

timer timer_inst(.digit(D), .clearn(clearn), .enable(mag_on), .loadn(loadn), .CLK(pgt_1Hz), .minutes(minutes), .secs(seconds_ones), .tens_secs(seconds_tens), .timer_done(timer_done));

control control_inst(.startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done), .mag_on(mag_on));

seg7_driver seg7_driver_inst(.seconds_ones(seconds_ones), .seconds_tens(seconds_tens), .minutes(minutes), .seconds_ones_out(seconds_ones_out), .seconds_tens_out(seconds_tens_out), .minutes_out(minutes_out));

endmodule