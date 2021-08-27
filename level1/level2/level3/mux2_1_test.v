module mux2_1_test();

reg selector;
reg d0;
reg d1;
wire out;

mux2_1 dut(selector, d0, d1, out);

always #10 selector =~ selector;

initial begin
    selector <= 0;
    d0<=1'b0;
    d1<=1'b0;
    #5d0=1'b0;
    #5d1=1'b0;
    #5d0=1'b1;
    #5d1=1'b0;
    #5d0=1'b1;
    #5d1=1'b1;
    #5d0=1'b0;
    #5d1=1'b1;
    #5d0=1'b0;
    #5d1=1'b0;
    #100 $finish;
end

initial begin
    $dumpfile("mux2_1.vcd");
    $dumpvars(0,mux2_1_test);
end

endmodule