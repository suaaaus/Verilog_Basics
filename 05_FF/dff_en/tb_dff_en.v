`timescale 1ns/100ps
module tb_dff_en();
	reg tb_clk;
	reg tb_en;
	reg tb_d;
	wire tb_q;
	wire tb_q_bar;
	
	_dff_en U_dff_en (
	.clk(tb_clk), 
	.en(tb_en),
	.d(tb_d),
	.q(tb_q),
	.q_bar(tb_q_bar)
	);
	
	always	#4 tb_clk = ~tb_clk;
	always	#6 tb_d = ~tb_d;
	
	initial begin
			tb_clk=0;	tb_en=1;		tb_d=0;
	#70	tb_en=0;	
	#50
	$finish;
	end
	
endmodule 