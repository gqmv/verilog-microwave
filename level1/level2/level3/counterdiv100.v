module counterdiv100(
    input wire clk,
    output wire clk_out
);

reg [6:0] count = 0;
reg reached100 = 0;
assign clk_out = reached100;

always @(posedge clk) begin
    count <= count + 1;

    if (count == 7'd99) begin
        reached100 <= 1;
        count <= 0;
    end
    else
        reached100 <= 0;
end

endmodule