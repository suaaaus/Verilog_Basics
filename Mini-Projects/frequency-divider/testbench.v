`timescale 1ns/1ns

module testbench();

	reg clk, en;
	reg [7:0] control_signal;
	wire pulse;
	
	wire [7:0] cnt, wmux, wDff;
	wire wpulse;


	

frequency_divider U_frequency_divider(.clk(clk), .en(en), .control_signal(control_signal), .pulse(pulse), .cnt(cnt), .wmux(wmux), .wDff(wDff), .wpulse(wpulse));


always #5 clk = ~clk;
initial
begin
    clk = 0;  control_signal=8'b0000_0111; en=0;
	//#7		reset_n=1; buffer로 입력값을 지연 
	#7 en=1;
	#1000  
	#1000	control_signal=8'b0000_0011;
	#1000	control_signal=8'b0000_0100;
	#1000	control_signal=8'b0000_0101;
	#1000	control_signal=8'b0000_1000;
	#1000	control_signal=8'b0001_0000;
	#1000

    $finish;
end

endmodule 