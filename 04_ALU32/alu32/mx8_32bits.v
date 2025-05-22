module mx8_32bits(a, b, c, d, e, f, g, h, s2, s1, s0, y);
	input [31:0] a, b, c, d, e, f, g, h;
	input s2, s1, s0;
	output [31:0] y;
	wire [31:0] w0, w1, w2, w3, w4, w5;

	mx2_32bits U0_mx2_32bits(.d0(a), .d1(b), .s(s0), .y(w0));
	mx2_32bits U1_mx2_32bits(.d0(c), .d1(d), .s(s0),.y(w1));
	mx2_32bits U2_mx2_32bits(.d0(e), .d1(f), .s(s0), .y(w2));
	mx2_32bits U3_mx2_32bits(.d0(g), .d1(h), .s(s0),.y(w3));
	mx2_32bits U4_mx2_32bits(.d0(w0), .d1(w1), .s(s1),.y(w4));
	mx2_32bits U5_mx2_32bits(.d0(w2), .d1(w3), .s(s1),.y(w5));
	mx2_32bits U6_mx2_32bits(.d0(w4), .d1(w5), .s(s2),.y(y));
endmodule 