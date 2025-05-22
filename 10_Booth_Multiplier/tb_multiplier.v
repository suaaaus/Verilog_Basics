`timescale 1ns/1ns
module tb_multiplier();

	reg clk, reset_n;
	reg [63:0] multiplicand, multiplier;
	reg op_start, op_clear;
	wire op_done;
	wire [127:0] result;
	
	
	multiplier U_multiplier(.clk(clk), .reset_n(reset_n), .multiplicand(multiplicand), .multiplier(multiplier), .op_start(op_start), .op_clear(op_clear), .op_done(op_done), .result(result));
	
	
	
	always #20 clk=~clk;
	
	
initial begin

		clk=1'b0;	reset_n=1'b0; multiplicand=64'h0000_0000_0000_0001; multiplier=64'h0000_0000_0000_0008; op_start=1'b0; op_clear=1'b0;
		#45		 reset_n=1'b1;
		#30 op_start=1'b1;
		#2800	

	   #100    op_clear=1'b1;
		#40 	op_clear=1'b0; multiplicand=64'h0000_0000_0000_0002; multiplier=64'h0000_0000_0000_0008;

		#3500 
		
		#10 op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0003; multiplier=64'h0000_0000_0000_0008;
		
		#3500
		
		#10 op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0004; multiplier=64'h0000_0000_0000_0008;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0005; multiplier=64'h0000_0000_0000_0008;
		
		#3500
		
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0006; multiplier=64'h0000_0000_0000_0008;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0007; multiplier=64'h0000_0000_0000_0008;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0009; multiplier=64'h0000_0000_0000_0008;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0001;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0002;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0003;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0004;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0005;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0006;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0007;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0008;
		
		#3500
		
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_0009;
		
		#3500
		op_clear=1'b1;
		
		#40 op_clear=1'b0; multiplicand=64'h0000_0000_0000_0008; multiplier=64'h0000_0000_0000_000a;
		
		#3500
	$stop;
	
	end
	
endmodule 