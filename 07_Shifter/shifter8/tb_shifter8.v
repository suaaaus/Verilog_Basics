`timescale 1ns/100ps
module tb_shifter8();


	reg clk, reset_n;
	reg [2:0] op;
	reg [1:0] shamt;
	reg [7:0] d_in;
	wire [7:0] d_out;


shifter8 U_shifter8(
	.clk(clk), 
	.reset_n(reset_n), 
	.op(op), 
	.shamt(shamt), 
	.d_in(d_in), 
	.d_out(d_out)
	);
	

	always #5 clk=~clk;
	
	
initial begin

		clk=0;	reset_n=1; op=3'b000; shamt=2'b00; d_in=8'b01110111;

		#30		 op=3'b001; shamt=2'b01;
		#30		 op=3'b010; 
		#30		 op=3'b011; 
		#30		 op=3'b100; 
		
		#30		 op=3'b001; shamt=2'b10;
		#30		 op=3'b010;
		#30		 op=3'b011; 
		#30		 op=3'b100; 
		
		#30		 op=3'b001; shamt=2'b11;
		#30		 op=3'b010; 
		#30		 op=3'b011; 
		#30		 op=3'b100; 
		#30
		#30		 op=3'b000; shamt=2'b10;
		#30		 reset_n=0;
		#30
		
	$finish;
	
	end
	
endmodule 