`timescale 1ns/100ps
module tb_dff_r();
	reg tb_clk;
	reg tb_reset_n;
	reg tb_d;
	wire tb_q;
	wire tb_q_bar;


	_dff_r U_dff_r (
	.clk(tb_clk), 
	.reset_n(tb_reset_n),
	.d(tb_d),
	.q(tb_q),
	.q_bar(tb_q_bar)
	);
	
	always	#4 tb_clk = ~tb_clk;
	always	#7 tb_d = ~tb_d;
	
	initial begin
			tb_clk=0;	tb_reset_n=0;		tb_d=0;
	#10	tb_reset_n=1;	
	#50	tb_reset_n=0;
	#20
	$finish;
	end
	
endmodule 