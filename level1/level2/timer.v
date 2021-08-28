`include "level2/level3/countermod10.v"
`include "level2/level3/countermod6.v"
// for local testing
// `include "level3/countermod10.v"
// `include "level3/countermod6.v"

module timer(output wire[3:0] minutes, tens_secs, secs,
             output wire      timer_done,
             input  wire[3:0] digit,
             input  wire      clearn, enable, loadn, CLK);  // 1Hz clock
             // the timer must be disabled by the magnetron_control
             // block when the timer gets done

    wire tc1;
    wire zero1;

    countermod10 seconds_counter(digit, loadn, clearn, CLK, enable, secs, tc1, zero1);

    wire tc2;
    wire zero2;

    countermod6 tens_secs_counter(secs, loadn, clearn, CLK, enable & zero1, tens_secs, tc2, zero2);

    wire tc3;
    wire zero3;

    countermod10 minutes_counter(tens_secs, loadn, clearn, CLK, enable & zero1 & zero2, minutes, tc3, zero3);


    assign timer_done = (zero1) & (zero2) & (zero3);  // the zero signal

    // if loadn is LOW, the timer is in load mode and will only receive
    // clock posedges for loading a digit. If loadn is HIGH, the timer is
    // in count mode and will receive a clock posedge signal every second
    

endmodule