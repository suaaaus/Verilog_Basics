module nonblocking(clk, a, b, c);
	input clk;
	input a;
	output reg b, c;
	
	always@ (posedge clk)
	begin
		b<=a;
		c<=b;
	end
endmodule
