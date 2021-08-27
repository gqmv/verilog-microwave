`include "control.v"
module control_test();
reg startn;
reg stopn;
reg clrn;
reg door_closed;
reg timer_done;
wire mag_on;

control dut(startn, stopn, clrn, door_closed, timer_done, mag_on);

initial begin
    startn = 0;door_closed = 1;timer_done = 0;stopn = 1;clrn = 1;
    #10 startn = 1;door_closed = 1;timer_done = 0;stopn = 0;clrn = 1;
    #10 startn = 0;door_closed = 1;timer_done = 0;stopn = 1;clrn = 1;
    #10 door_closed = 0;
    
    #100 $finish;
end

initial begin
    $dumpfile("control.vcd");
    $dumpvars(0, control_test);
end

endmodule