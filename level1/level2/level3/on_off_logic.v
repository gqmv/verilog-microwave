module on_off_logic(
    input startn,
    input stopn,
    input clrn,
    input door_closed,
    input timer_done,
    output set,
    output reset
);

wire set_internal, reset_internal;

assign set_internal = (~startn) & door_closed & (~timer_done);
assign reset_internal = (~door_closed) | (~clrn) | (~stopn) | timer_done;

assign set = set_internal;
assign reset = reset_internal;

endmodule