`timescale 1ns/1ns
module tb_Register_file();
	reg clk, reset_n, we;
	reg [2:0] wAddr, rAddr;
	reg [31:0] wData;
	wire [31:0] rData;


Register_file U_RF(
	.clk(clk), 
	.reset_n(reset_n), 
	.we(we), 
	.wAddr(wAddr), 
	.rAddr(rAddr), 
	.wData(wData),
	.rData(rData)
	);
	

	always #20 clk=~clk;
	
	
initial begin

		clk=1'b0;	reset_n=1'b0; we=1'b0; wAddr=3'b000; rAddr=3'b000; wData=32'h0000_0000;

		#30		 reset_n=1'b1; we=1'b1; wData=32'h1234_4321;
		#40		 wAddr=3'b001; wData=32'h7777_ffff;
		#40		 wAddr=3'b010; 
		#40		 wAddr=3'b011; wData=32'hffff_7777;
		#40		 wAddr=3'b001;
		
		#40		 wAddr=3'b010;
		#40		 wAddr=3'b011;
		#40		 we=1'b0;
		#50		 rAddr=3'b001; 
		#50		 rAddr=3'b010;
		#200
		
	$finish;
	
	end
	
endmodule 