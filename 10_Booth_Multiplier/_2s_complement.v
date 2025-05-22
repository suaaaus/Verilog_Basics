module _2s_complement(a, y);
	input [63:0] a;
	output [63:0] y;

	wire x;//버림 
	

	cla64 U0_cla64(.a(~a), .b(64'h0000_0000_0000_0001), .ci(1'b0), .co(x), .s(y));
	
endmodule 