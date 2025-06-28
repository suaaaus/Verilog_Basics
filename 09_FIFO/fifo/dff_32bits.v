module dff_32bits(clk, reset_n, d, q);
	input clk, reset_n;
	input [31:0] d;
	output reg [31:0] q;
	
	always@(posedge clk or negedge reset_n) begin
		if(reset_n == 0) 
		   q <= 32'h0;
		else 
		   q <= d; 
	end
	
endmodule 