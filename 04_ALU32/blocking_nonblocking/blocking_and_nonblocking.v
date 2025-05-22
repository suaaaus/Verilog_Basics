module blocking_and_nonblocking(clk, a, b, c, d, e);
	input clk;
	input a;
	output b, c, d, e;
	
	blocking U0_blokcing (.clk(clk), .a(a), .b(b), .c(c));
	nonblocking U1_nonblocking (.clk(clk), .a(a), .b(d), .c(e));
	
endmodule

