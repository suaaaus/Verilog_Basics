`timescale 1ns/100ps
module tb_cntr8();


	reg clk, reset_n, inc, load;
	reg [7:0] d_in;

	wire [2:0] o_state;


shifter8 U_shifter8(
	.clk(clk), 
	.reset_n(reset_n), 
	.inc(inc), 
	.load(load), 
	.d_in(d_in), 
	.o_state(o_state)
	);
	

	always #5 clk=~clk;
	
	
initial begin

		clk=0;	reset_n=1; inc=0; load=0; d_in=8'b01110111;

		#30		
		
	$finish;
	
	end
	
endmodule 