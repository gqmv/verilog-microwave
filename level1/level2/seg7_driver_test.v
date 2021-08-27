`include "seg7_driver.v"

module seg7_driver_test();
reg [3:0] seconds_ones, seconds_tens, minutes;
wire [6:0] seconds_ones_out, seconds_tens_out, minutes_out;

seg7_driver dut(seconds_ones, seconds_tens, minutes, seconds_ones_out, seconds_tens_out, minutes_out);

initial begin
    seconds_ones=0; seconds_tens=0; minutes=0;    

	#10 seconds_ones=1; seconds_tens=1; minutes=0;    
	#10 seconds_ones=1; seconds_tens=1; minutes=0;    
	#10 seconds_ones=1; seconds_tens=1; minutes=0;    
	#10 seconds_ones=1; seconds_tens=1; minutes=0;    
	#10 seconds_ones=1; seconds_tens=1; minutes=1;    
	#10 seconds_ones=1; seconds_tens=1; minutes=1;    
	#10 seconds_ones=1; seconds_tens=1; minutes=1;    
	#10 seconds_ones=1; seconds_tens=1; minutes=1;
end

initial begin
    $dumpfile("seg7_driver.vcd");
    $dumpvars(0, seg7_driver_test);
end

endmodule