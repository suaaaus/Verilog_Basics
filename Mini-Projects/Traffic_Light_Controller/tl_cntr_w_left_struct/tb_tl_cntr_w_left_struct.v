`timescale 1ns/1ns
module tb_tl_cntr_w_left_struct();

	reg clk, reset_n;
	reg Ta, Tb, Tal, Tbl;
	wire [1:0] La, Lb;
	

	tl_cntr_w_left_struct U_tl_cntr_w_left_struct(
		.clk(clk), 
		.reset_n(reset_n), 
		.Ta(Ta), 
		.Tal(Tal),
		.Tb(Tb),
		.Tb(Tbl),
		.La(La), 
		.Lb(Lb)
	);
	
	
	always #20 clk=~clk;
	
	initial begin
	clk=0;	
	Ta=0;
	Tal=0;
	Tb=0;
	Tbl=0;
	reset_n=0;
	
	#50
	reset_n=1;
	
	#200
	$finish;
	
	end
	
endmodule 