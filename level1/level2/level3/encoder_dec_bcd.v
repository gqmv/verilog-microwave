module encoder_dec_bcd(
    input [9:0] decimal,
    input enable,
    output reg [3:0] bcd,
    output reg loadn
);

initial begin
    loadn<=0;
end

always @ (decimal)
begin
    if (!enable) begin
        loadn<=1;
    case(decimal)
        10'b0000000001:bcd=4'b0000;
        10'b0000000010:bcd=4'b0001;
        10'b0000000100:bcd=4'b0010;
        10'b0000001000:bcd=4'b0011;
        10'b0000010000:bcd=4'b0100;
        10'b0000100000:bcd=4'b0101;
        10'b0001000000:bcd=4'b0110;
        10'b0010000000:bcd=4'b0111;
        10'b0100000000:bcd=4'b1000;
        10'b1000000000:bcd=4'b1001;

        default: begin
            loadn<=0;
        end
    endcase
    end
end
endmodule