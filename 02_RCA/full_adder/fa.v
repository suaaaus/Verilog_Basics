module fa(a, b, ci, s, co);
	input a, b, ci;
	output s, co;
	wire c1, c2, sm;
	
	ha ha1(.s(sm), .co(c1), .a(b), .b(ci));
	ha ha2(.s(s), .co(c2), .a(a), .b(sm));
	_or2 or1(.y(co), .a(c1), .b(c2));
	
		
endmodule

