module counterdiv100_test();

reg clk;
wire clk_out;

counterdiv100 dut(clk, clk_out);

initial clk = 0;
always #5 clk = ~clk;

initial begin
    $dumpfile("counterdiv100.vcd");
    $dumpvars(0,counterdiv100_test);
    #1000 $finish;
end

endmodule