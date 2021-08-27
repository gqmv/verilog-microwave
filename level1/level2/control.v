`include "level2/level3/on_off_logic.v"
`include "level2/level3/sr_latch.v"
// `include "level3/on_off_logic.v"
// `include "level3/sr_latch.v"
module control(
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire timer_done,
    output wire mag_on
);

wire latch_set, wire_reset;

on_off_logic on_off_logic_inst(startn, stopn, clearn, door_closed, timer_done, latch_set, latch_reset);

wire Q;

sr_latch sr_latch_inst(.S(latch_set), .R(latch_reset), .Q(Q));

assign mag_on = Q;

endmodule


