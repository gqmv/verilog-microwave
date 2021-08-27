module counter0_7 (
    input wire clk,
    input wire clear,
    output reg out
);

reg [3:0]count; // Maintains the current count
reg is_counting = 0; // Maintains the state of the counter

initial begin // Defines initial values
    out <= 0;
    count <= 0;
end

always @(negedge clear) begin // When clear is deactivated, starts the counter.
    if (count == 3'd0) begin
        is_counting = 1;
    end
end

always @(posedge clear) begin // When clear is activated, stops the counter if count is at 7.
    if (count == 3'd7) begin
        is_counting = 0;
        count = 3'd0;
        out = 0;
    end
end

always @(posedge clk) begin // Counts up if the counter is active.
    if (is_counting && count < 3'd7) begin
        count <= count + 1;
    end

    if (count == 3'd3) begin
        out <= 1;
    end
end


endmodule