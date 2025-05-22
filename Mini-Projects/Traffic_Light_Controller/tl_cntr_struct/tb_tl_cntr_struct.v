`timescale 1ns/100ps
module tb_tl_cntr_struct();

	reg clk, reset_n;
	reg Ta, Tb;
	wire [1:0] La, Lb;
	

	tl_cntr_struct U_tl_cntr_struct(
		.clk(clk), 
		.reset_n(reset_n), 
		.Ta(Ta), 
		.Tb(Tb), 
		.La(La), 
		.Lb(Lb)
	);
	
	
	always #5 clk=~clk;
	initial begin
	clk=0;	
	Ta=0;
	Tb=0;
	reset_n=0;
	
	#50
	reset_n=1;
	
	#200
	$finish;
	
	end
	
endmodule 