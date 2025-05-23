module _8bit_NOR (a, b, c, d, e, f, g, h, y);
	input a, b, c, d, e, f, g, h;
	output y;
	
	assign y = ~(a | b | c | d | e | f | g | h);
	
endmodule 