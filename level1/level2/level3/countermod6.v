module countermod6 (
    input wire [3:0] data,
    input wire loadn,
    input wire clrn,
    input wire clk,
    input wire en,
    output reg [3:0] tens,
    output reg tc,
    output wire zero
);

initial begin
    tc = 0;
end

always @ (negedge clrn)
begin
    tens = 4'b0000;
end

assign zero = (tens == 4'b0000) ? 1'b1 : 1'b0;

always @ (posedge clk)
begin
    if (en) 
        case (tens)
            4'b1001: tens <= 4'b1000; // 9 -> 8
            4'b1000: tens <= 4'b0111; // 8 -> 7
            4'b0111: tens <= 4'b0110; // 7 -> 6
            4'b0110: tens <= 4'b0101; // 6 -> 5
            4'b0101: tens <= 4'b0100; // 5 -> 4
            4'b0100: tens <= 4'b0011; // 4 -> 3
            4'b0011: tens <= 4'b0010; // 3 -> 2
            4'b0010: tens <= 4'b0001; // 2 -> 1
            4'b0001: begin 
                tens <= 4'b0000;
                tc <= 1'b1;
            end  // 1 -> 0
            4'b0000: begin
                tens <= 4'b0101;
                tc <= 1'b0;
            end // 0 -> 5
            default: tens <= 4'b0000;
        endcase
    
    else begin 
        tc <= 0;

        if(!loadn)
            tens <= data;

    end
end
    
endmodule