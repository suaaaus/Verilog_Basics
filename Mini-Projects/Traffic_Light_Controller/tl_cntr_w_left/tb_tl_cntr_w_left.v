`timescale 1ns/1ns
module tb_tl_cntr_w_left();

	reg clk, reset_n;
	reg Ta, Tb, Tal, Tbl;
	wire [1:0] La, Lb;
	

	tl_cntr_w_left U_tl_cntr_w_left(
		.clk(clk), 
		.reset_n(reset_n), 
		.Ta(Ta), 
		.Tal(Tal),
		.Tb(Tb), 
		.Tbl(Tbl),
		.La(La), 
		.Lb(Lb)
	);
	
	
	always #22 clk=~clk;
	initial begin
	clk=0;	
	Ta=0;
	Tal=0;
	Tb=0;
	Tbl=0;
	reset_n=0;
	
	#200
	reset_n=1;
	
	#300
	Ta=1;
	#300
	Ta=0; Tb=1;
	#300
	Tal=1;
	#300;
	Tal=0; Tbl=1;
	#300
	
	
	$finish;
	
	end
	
endmodule 