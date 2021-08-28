module countermod10 (
    input wire [3:0] data,
    input wire loadn,
    input wire clrn,
    input wire clk,
    input wire en,
    output wire [3:0] ones,
    output wire tc,
    output wire zero
);

    reg [ 3: 0 ] cur_state;
    assign ones = cur_state; 

    assign zero = (cur_state == 0) ? 1 : 0;
    assign tc = ((cur_state == 0) & en) ? 1 : 0;

    always @(posedge clk)
    begin: COUNTER
        if (en) begin
            if (cur_state == 4'b0000) begin
                cur_state <= 4'd9;
                //tc <= 1;
            end
            else begin
                cur_state <= cur_state - 1;
                //tc <= 0;
            end
        end
        else begin
            if (!loadn) begin
                cur_state <= data;
            end
        end
    end

    always @(negedge clrn) begin
        if (!clrn) begin
            cur_state <= 4'b0000;
            //tc <= 1;
        end
    end

endmodule