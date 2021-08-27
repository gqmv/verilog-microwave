`include "controler.v"
module controler_test();
reg [9:0] keypad;
reg clk;
reg startn;
reg stopn;
reg door_closed;
reg clrn;

wire [6:0] seconds_ones, seconds_tens, minutes;
wire mag_on;

controler dut(.startn(startn), .stopn(stopn), .door_closed(door_closed), .clrn(clrn), .keypad(keypad), .clk(clk), .seconds_ones(seconds_ones), .seconds_tens(seconds_tens), .minutes(minutes), .mag_on(mag_on));

initial clk = 0;

always # 5 clk = ~clk;

initial begin
    $dumpfile("controler.vcd");
    $dumpvars(0, controler_test);
end

initial begin
        keypad = 9'b000000000;
        door_closed = 0;
        stopn = 1;
        clrn = 1;
        startn = 1;

        // Digitando o 3
        #120000;
        keypad = 9'b000001000;
        #110000;
        keypad = 9'b000000000;

        // Digitando o 5
        #110000;
        keypad = 9'b000100000;
        #110000;
        keypad = 9'b000000000;

        // Digitando o 9
        #110000;
        keypad = 10'b1000000000;
        #110000;
        keypad = 9'b000000000;

        // Tentando abrir
        #110000;
        startn = 0;
        #110000;
        startn = 1;
        #510000;
        // Fechando a porta
        door_closed = 1;
        #100000;
        startn = 0;
        #100000;
        startn = 1;
        #300000000;
end