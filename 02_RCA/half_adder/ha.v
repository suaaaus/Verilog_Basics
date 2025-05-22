module ha(a, b, s, co);
	input a, b;
	output s, co;
	
	_and2 and1 (.y(co), .a(a), .b(b));
	_xor2 xor1 (.y(s), .a(a), .b(b));
	
endmodule 