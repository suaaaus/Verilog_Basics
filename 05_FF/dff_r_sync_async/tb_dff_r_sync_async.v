`timescale 1ns/100ps
module tb_dff_r_sync_async();

	reg clk, reset_n, d;
	wire q_sync, q_async;
	
	_dff_r_sync_async U_dff_r_sync_async (
	.clk(clk),
	.reset_n(reset_n),
	.d(d),
	.q_sync(q_sync),
	.q_async(q_async)
	);
	
	always #10 clk=~clk;
	always #6	d=~d;
	always #27 reset_n=~reset_n;
	
	initial begin
	clk=0;	
	d=0;
	reset_n=0;
	
	#400
	
	$finish;
	end
	
endmodule 