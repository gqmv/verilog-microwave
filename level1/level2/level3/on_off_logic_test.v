`include "on_off_logic.v"

module on_off_logic_test();
reg startn;
reg stopn;
reg clrn;
reg door_closed;
reg timer_done;
wire set;
wire reset;

on_off_logic dut(startn, stopn, clrn, door_closed, timer_done, set, reset);

initial begin
    startn = 0;door_closed = 1;timer_done = 0;stopn = 1;clrn = 1;
    #10 startn = 0;door_closed = 0;timer_done = 1;stopn = 1;clrn = 0;
    #10 startn = 0;door_closed = 1;timer_done = 0;stopn = 0;clrn = 1;
    #10 startn = 0;door_closed = 1;timer_done = 1;stopn = 1;clrn = 1;
    #10 startn = 1;door_closed = 0;timer_done = 0;stopn = 0;clrn = 0;
    #10 startn = 1;door_closed = 0;timer_done = 1;stopn = 0;clrn = 0;
    #10 startn = 1;door_closed = 1;timer_done = 0;stopn = 1;clrn = 0;
    #10 startn = 1;door_closed = 1;timer_done = 1;stopn = 1;clrn = 1;
    #10 startn = 1;door_closed = 1;timer_done = 1;stopn = 0;clrn = 0;
end

initial begin
    $dumpfile("on_off_logic.vcd");
    $dumpvars(0, on_off_logic_test);
end

endmodule
