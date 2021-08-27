`include "encoder.v"
module encoder_test;
reg [9:0] numpad;
reg enable;
reg clk;
wire [3:0] D;
wire loadn;
wire pgt_1Hz;

encoder dut(numpad, enable, clk, D, loadn, pgt_1Hz);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    enable <= 0;
    #5 numpad <= 4'd1;
    #2 numpad <= 4'dx;
    #5 numpad <= 4'd0;
    #2 numpad <= 4'dx;
    #5 numpad <= 4'd5;
    #2 numpad <= 4'dx;
    #100 enable <= 1;
    #1000 $finish;
end

initial begin
    $dumpfile("encoder.vcd");
    $dumpvars(0, encoder_test);
end

endmodule