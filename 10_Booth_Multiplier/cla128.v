module cla128(a, b, ci, co, s);
	input [127:0] a, b;
	input ci;
	output [127:0] s;
	output co;

	
	wire c1, c2, c3;

   cla32 U0_cla32 (.a(a[31:0]), .b(b[31:0]), .ci(ci), .s(s[31:0]), .co(c1));
	cla32 U1_cla32 (.a(a[63:32]), .b(b[63:32]), .ci(c1), .s(s[63:32]), .co(c2));
	cla32 U2_cla32 (.a(a[95:64]), .b(b[95:64]), .ci(c2), .s(s[95:64]), .co(c3));
	cla32 U3_cla32 (.a(a[127:96]), .b(b[127:96]), .ci(c3), .co(co), .s(s[127:96]));

	
	
	endmodule 