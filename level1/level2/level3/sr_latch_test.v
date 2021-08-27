module sr_latch_test();
reg S, R;
wire Q, Q_bar;

sr_latch dut(S, R, Q, Q_bar);

initial begin
    // Inputs
    S = 1;
    R = 1;

    // Stimulus
    #10 S = 0;
    #10 S = 1;
    #10 R = 0;
    #10 R = 1;
    #10 S = 0;
         R = 0;
    #10 S = 1;
         R = 1;
    #10 S = 0;
         R = 0;
    #10 $finish;
end

initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(0,sr_latch_test);
end

endmodule