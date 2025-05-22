`timescale 1ns/100ps
module tb_cnt5();

	reg clk, reset_n, inc;
	wire [2:0]	cnt;

cnt5 U_cnt5(
	.clk(clk), 
	.reset_n(reset_n), 
	.inc(inc),
	.cnt(cnt)
	);
	

	always #5 clk=~clk;
	
	
initial begin

		clk=0;		reset_n=0; inc=1;
	#10 		inc=1;
	#10 		inc=1;
	#10		inc=1;
	#10		inc=1;
	#10 		inc=0;
	#10 		inc=0;
	#10		inc=0;
	#10		inc=0;
					reset_n=1; inc=1;
	#10 		inc=1;
	#10 		inc=1;
	#10		inc=1;
	#10		inc=1;
	#10 		inc=0;
	#10 		inc=0;
	#10		inc=0;
	#10		inc=0;
	#10		inc=0;
	#10		
	$finish;
	
	end
	
endmodule 