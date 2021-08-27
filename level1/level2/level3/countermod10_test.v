module countermod10_test();
reg [3:0] data;
reg loadn, clrn, clk, en;

wire [3:0] ones;
wire tc, zero;

countermod10 dut (data, loadn, clrn, clk, en, ones, tc, zero);

initial clk = 0;
always #10 clk = !clk;

initial begin
    assign loadn = 1;
    assign en = 0; 
    assign clrn = 1;
    assign data = 4'b0110;

    #5 assign loadn = 0;

    #5 assign loadn = 1;

    #5 assign en = 1; 

    // assign loadn = 1; 
    // assign en = 0; 
    // assign clrn = 1;
    // assign data = 4'b0110;
    // #5 assign loadn = 0;
    // #5 assign loadn = 1; 
    // #5 assign en = 1; 
    // #50 assign clrn = 0;
    // assign en = 0;

    #400 $finish;
end

initial begin
    $monitor("simtime = %g,data =%b, loadn =%b, clrn =%b, clk =%b, en =%b, ones =%b, tc =%b, zero =%b", $time,data, loadn, clrn, clk, en, ones, tc, zero);
    $dumpfile("countermod10.vcd");
    $dumpvars(0,countermod10_test);
end

endmodule