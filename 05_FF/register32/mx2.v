module mx2(d0, d1, s, y);
	
	input d0, d1;
	input s;
	output y;
	wire sb, w0, w1;

	
	_inv U0_inv(.a(s), .y(sb));
	_nand2 U1_nand2(.a(d0), .b(sb), .y(w0));
	_nand2 U2_nand2(.a(d1), .b(s), .y(w1));
	_nand2 U3_nand2(.a(w0), .b(w1), .y(y));

endmodule
