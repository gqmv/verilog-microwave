`timescale 1ms/1ms
`include "controler.v"
module controler_test();
    reg [9:0] keypad;
    reg clk;
    reg startn;
    reg stopn;
    reg door_closed;
    reg clearn;

    wire [6:0] seconds_ones, seconds_tens, minutes;
    wire mag_on;

    controler dut(.startn(startn), .stopn(stopn), .door_closed(door_closed), .clearn(clearn), .keypad(keypad), .clk(clk), .seconds_ones_out(seconds_ones), .seconds_tens_out(seconds_tens), .minutes_out(minutes), .mag_on(mag_on));

    initial clk = 0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("controler.vcd");
        $dumpvars(0, controler_test);
    end

    initial begin
            keypad = 9'b000000000;
            door_closed = 0;
            stopn = 1;
            startn = 1;

            // Inicializando o contador
            clearn = 1; #1;
            clearn = 0; #1;
            clearn = 1;

            // Digitando o 2
            #1100;
            keypad = 9'b000000100;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 5
            #1100;
            keypad = 9'b000100000;
            #1100;
            keypad = 9'b000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 9'b000000000;

            // Tentando abrir
            #1100;
            startn = 0;
            #1100;
            startn = 1;
            #1100;
            // Fechando a porta
            door_closed = 1;
            #1000;
            startn = 0;
            #1000;
            startn = 1;
            #3000000;
            $finish();
    end

endmodule