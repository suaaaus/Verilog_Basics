`timescale 1ns/100ps
module tb_register32_8();


	reg clk, reset_n;
	reg [7:0]en;
	reg [31:0]d_in;
	wire [31:0]d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7;


register32_8 U_register32_8(
	.clk(clk), 
	.reset_n(reset_n), 
	.en(en), 
	.d_in(d_in), 
	.d_out0(d_out0), 
	.d_out1(d_out1), 
	.d_out2(d_out2), 
	.d_out3(d_out3), 
	.d_out4(d_out4), 
	.d_out5(d_out5), 
	.d_out6(d_out6), 
	.d_out7(d_out7)
	);
	

	always #5 clk=~clk;
	
	
initial begin

		clk=0;	reset_n=1; en=8'b0101_0101;

		#10		 d_in=32'h00ff_ff00;
		#30		 en=8'b0000_1111; 
		#30		 d_in=32'h1234_ff00;
		#10		 reset_n=0; en=1;
		#10		 reset_n=0; en=0;
		#30		 
	$finish;
	
	end
	
endmodule 