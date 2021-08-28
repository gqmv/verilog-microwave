module sr_latch (
    input wire S,
    input wire R,
    output wire Q,
    output wire Q_bar
);

wire Q_int, Q_bar_int;

assign Q_int = ~(R | Q_bar_int);
assign Q_bar_int = ~(S | Q_int);
assign Q = Q_int;
assign Q_bar = Q_bar_int;
    
endmodule