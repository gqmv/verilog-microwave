module countermod6_test();
reg [3:0] data;
reg loadn, clrn, clk, en;

wire [3:0] tens;
wire tc, zero;

countermod6 dut(data, loadn, clrn, clk, en, tens, tc, zero);

initial clk = 0;
always #10 clk = !clk;

initial begin
    $dumpfile("countermod6.vcd");
    $dumpvars(0,countermod6_test);
end

initial begin
    assign loadn = 1;
    assign en = 0; 
    assign clrn = 1;
    assign data = 4'b0110;
    #5 assign loadn = 0; 
    #5 assign loadn = 1; 
    #5 assign en = 1;

    #5 $finish; 
end

endmodule