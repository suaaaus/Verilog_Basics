`timescale 1ns/100ps
module tb_register32();
	reg tb_clk;
	reg  [31:0] tb_d;
	wire [31:0] tb_q;
	wire [31:0] tb_q_bar;


	_register32 U_register32 (
	.clk(tb_clk), 
	.d(tb_d),
	.q(tb_q),
	.q_bar(tb_q_bar)
	);
	
	always	#10 tb_clk = ~tb_clk;
	
	initial begin
			tb_clk=1'b0;		tb_d=32'h1234_5678;
	#6		tb_d=32'h9876_5432;
	#6		tb_d=32'hffee_ddaa;
	#10	tb_d=32'haabb_cc00;
	#8		tb_d=32'h5522_5522;
	#10	tb_d=32'h2001_0910;
	#3		tb_d=32'haaaa_aaaa;
	#10
	$finish;
	end
	
endmodule 