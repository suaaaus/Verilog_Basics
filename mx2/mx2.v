module nd(y,a,b);
	input a, b;
	output y;
	
assign y=~(a&b);

endmodule



module mx2(y, d0, d1, s);
	input d0, d1, s;
	output y;
	
nd nd20 (.y(w0), .a(d0), .b(~s));
nd nd21 (.y(w1), .a(d1), .b(s));
nd nd22 (y, w0, w1);

endmodule
