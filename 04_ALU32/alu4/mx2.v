module mx2(d0, d1, s, y);
	input d0, d1;
	input s;
	output y;
	wire sb, w0, w1;
	
	//instances of inverter and nand gate
	_inv U0_inv(.y(sb), .a(s));
	_nand2 U1_nd1 (.y(w0), .a(d0), .b(sb));
	_nand2 U2_nd2 (.y(w1), .a(d1), .b(s));
	_nand2 U3_nd3 (y, w0, w1);
	
endmodule 