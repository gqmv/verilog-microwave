`timescale 1s/1ms
module timer_tb();

    wire[3:0] minutes_tb, tens_secs_tb, secs_tb;
    wire timer_done_tb;
    reg [3:0]  digit_tb;
    reg clearn_tb, enable_tb, loadn_tb, CLK_tb;

    timer DUT (minutes_tb, tens_secs_tb, secs_tb, timer_done_tb,
               digit_tb, clearn_tb, enable_tb, loadn_tb, CLK_tb);


    initial begin
        $dumpfile("timer_tb.vcd");
        $dumpvars(0, timer_tb);
        CLK_tb  = 1'b0;
        enable_tb = 1'b0; 
        loadn_tb  = 1'b0;
    end

    always begin
        #1 CLK_tb = loadn_tb? ~CLK_tb : CLK_tb;
    end

    initial begin    

        clearn_tb = 1'b1; #0.5
        clearn_tb = 1'b0; #0.5
        clearn_tb = 1'b1; #0.5

        digit_tb =  2;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        digit_tb =  1;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        digit_tb =  7;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        digit_tb =  9;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        enable_tb = 1; loadn_tb = 1; #1000;

        $display("Successful");
        $finish();
    end

endmodule

