module seg7_driver(
    input wire [3:0] seconds_ones,
    input wire [3:0] seconds_tens,
    input wire [3:0] minutes,

    output wire [6:0] seconds_ones_out,
    output wire [6:0] seconds_tens_out,
    output wire [6:0] minutes_out
);

assign seconds_ones_out = (seconds_ones == 4'b0000)? 7'b0000001: 
                          (seconds_ones == 4'b0001)? 7'b1001111:
                          (seconds_ones == 4'b0010)? 7'b0010010: 
                          (seconds_ones == 4'b0011)? 7'b0000110:
                          (seconds_ones == 4'b0100)? 7'b1001100:
                          (seconds_ones == 4'b0101)? 7'b0100100:
                          (seconds_ones == 4'b0110)? 7'b0100000:
                          (seconds_ones == 4'b0111)? 7'b0001101:
                          (seconds_ones == 4'b1000)? 7'b0000000:
                          (seconds_ones == 4'b1001)? 7'b0000100:
                          8'b1111111;

assign seconds_tens_out = (seconds_tens == 4'b0000)? 7'b0000001: 
                          (seconds_tens == 4'b0001)? 7'b1001111:
                          (seconds_tens == 4'b0010)? 7'b0010010: 
                          (seconds_tens == 4'b0011)? 7'b0000110:
                          (seconds_tens == 4'b0100)? 7'b1001100:
                          (seconds_tens == 4'b0101)? 7'b0100100:
                          (seconds_tens == 4'b0110)? 7'b0100000:
                          (seconds_tens == 4'b0111)? 7'b0001101:
                          (seconds_tens == 4'b1000)? 7'b0000000:
                          (seconds_tens == 4'b1001)? 7'b0000100:
                          8'b1111111;

assign minutes_out =      (minutes == 4'b0000)? 7'b0000001: 
                          (minutes == 4'b0001)? 7'b1001111:
                          (minutes == 4'b0010)? 7'b0010010: 
                          (minutes == 4'b0011)? 7'b0000110:
                          (minutes == 4'b0100)? 7'b1001100:
                          (minutes == 4'b0101)? 7'b0100100:
                          (minutes == 4'b0110)? 7'b0100000:
                          (minutes == 4'b0111)? 7'b0001101:
                          (minutes == 4'b1000)? 7'b0000000:
                          (minutes == 4'b1001)? 7'b0000100:
                          8'b1111111;

endmodule
