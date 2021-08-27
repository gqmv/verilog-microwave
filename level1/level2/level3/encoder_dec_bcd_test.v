module encoder_dec_bcd_test();
reg [9:0] decimal;
reg enable;
wire [3:0] bcd;
wire loadn;

encoder_dec_bcd dut(decimal, enable, bcd, loadn);

initial begin
    enable = 0;
    #1 decimal = 4;
    #5 decimal = 1'bx;
    #1 decimal = 3;
    #5 decimal = 1'bx;
    #1 decimal = 6;
    #5 decimal = 1'bx;
    decimal = 1'bx;
    #1 $finish;
end

initial begin
    $dumpfile("encoder_dec_bcd.vcd");
    $dumpvars(0,encoder_dec_bcd_test);
end
endmodule