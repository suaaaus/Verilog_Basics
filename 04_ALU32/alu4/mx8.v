module mx8(a, b, c, d, e, f, g, h, s2, s1, s0, y);
	input a, b, c, d, e, f, g, h;
	input s2, s1, s0;
	output y;
	
	wire w0, w1, w2, w3, w4, w5;
	
	// instances of mx2(1bit 2-to-1 multiplexer)
	mx2 U4_mx2(.y(w0), .d0(a), .d1(b), .s(s0));
	mx2 U5_mx2(.y(w1), .d0(c), .d1(d), .s(s0));
	mx2 U6_mx2(.y(w2), .d0(e), .d1(f), .s(s0));
	mx2 U7_mx2(.y(w3), .d0(g), .d1(h), .s(s0));
	
	mx2 U8_mx2(.y(w4), .d0(w0), .d1(w1), .s(s1));
	mx2 U9_mx2(.y(w5), .d0(w2), .d1(w3), .s(s1));
	
	mx2 U10_mx2(.y(y), .d0(w4), .d1(w5), .s(s2));

endmodule 