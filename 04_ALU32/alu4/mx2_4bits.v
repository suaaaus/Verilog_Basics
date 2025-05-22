module mx2_4bits (d0, d1, s, y);
	input [3:0] d0, d1;
	input s;
	output [3:0] y;
	
	//Instances of mx2
	mx2 U0_mx2(.y(y[0]), .d0(d0[0]), .d1(d1[0]), .s(s));
	mx2 U1_mx2(.y(y[1]), .d0(d0[1]), .d1(d1[1]), .s(s));
	mx2 U2_mx2(.y(y[2]), .d0(d0[2]), .d1(d1[2]), .s(s));
	mx2 U3_mx2(.y(y[3]), .d0(d0[3]), .d1(d1[3]), .s(s));

endmodule
