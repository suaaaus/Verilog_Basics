`timescale 1ns/100ps
module tb_register2_r_async();

	reg clk, reset_n;
	reg d1, d0;
	wire q1, q0, q1_bar, q0_bar;
	


	_register2_r_async U__register2_r_async(
	.clk(clk),
	.reset_n(reset_n),
	.d1(d1),
	.d0(d0),
	.q1(q1),
	.q0(q0),
	.q1_bar(q1_bar),
	.q0_bar(q0_bar)
	);
	
	
	always #5 clk=~clk;
	initial begin
	clk=0;	
	reset_n=0;
	d1=0; d0=0;
	#10 		d1=1;
	#10 		d0=1;
	#20		reset_n=1;	d1=0; d0=0;
	#30		d1=1;
	#30		d1=0;	d0=1;
	#30
	$finish;
	
	end
	
endmodule 