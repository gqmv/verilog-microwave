module countermod6 (
    input wire [3:0] data,
    input wire loadn,
    input wire clrn,
    input wire clk,
    input wire en,
    output reg [3:0] tens,
    output reg tc,
    output reg zero
);

initial begin
    tc = 0;
    zero = 0;
end

always @ (negedge clrn)
begin
    tens = 4'b0000;
end

always @ (negedge loadn)
begin
    tens <= data;
end

always @ (posedge clk)
begin
    if (en) 
        case (tens)
            4'b0110: begin
                tens <= 4'b0101;
                tc <= 1'b0;
                zero <= 1'b0;
            end
            4'b0101: tens <= 4'b0100; // 5 -> 4
            4'b0100: tens <= 4'b0011; // 4 -> 3
            4'b0011: tens <= 4'b0010; // 3 -> 2
            4'b0010: tens <= 4'b0001; // 2 -> 1
            4'b0001: begin
                tens <= 4'b0000;
                zero <= 1'b1;
            end  // 1 -> 0
            4'b0000: begin
                tens <= 4'b0110;
                tc <= 1'b1;
                zero <= 1'b0;
            end
            default: tens <= 4'b0000;
        endcase
    end
endmodule