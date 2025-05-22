`timescale 1ns/1ns
module tb_dff;

	reg clk;
	reg d;
	wire q;
	wire q_bar;

	
	
	_dlatch U_dlatch (
	.clk(clk),
	.d(d),
	.q(q),
	.q_bar(q_bar)
	);
	
	
	
	always #10 clk = ~clk;
	
	initial
	begin
				clk = 0; d = 0; 
				#15 d=1;
				#10 d=0;
				#20 d=1;
				#30 d=0;
				#20 d=1;
				#10
				$finish;
	end

endmodule 