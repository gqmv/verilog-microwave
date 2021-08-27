`include "level3/countermod10.v"
`include "level3/countermod6.v"

module timer(output reg[3:0]  minutes, tens_secs, secs,
             output wire      timer_done,
             input  wire[3:0] digit,
             input  wire      clearn, enable, loadn, CLK);  // 1Hz clock
             // the timer must be disabled by the magnetron_control
             // block when the timer gets done

    wire ones_sec;
    wire tc1;
    wire zero1;

    countermod10 seconds_counter(digit, loadn, clearn, CLK, enable, ones_sec, tc1, zero1);


    assign timer_done = (~minutes) & (~tens_secs) & (~secs);

    // if loadn is LOW, the timer is in load mode and will only receive
    // clock posedges for loading a digit. If loadn is HIGH, the timer is
    // in count mode and will receive a clock posedge signal every second
    

endmodule