module cla8(a, b, ci, s, co);
	input [7:0] a,b; 
	input ci;
	output [7:0] s;
	output co; 
	wire c1;

	cla4 U0_cla4(.a(a[3:0]),.b(b[3:0]),.ci(ci),.s(s[3:0]),.co(c1));

	cla4 U1_cla4(.a(a[7:4]),.b(b[7:4]),.ci(c1),.s(s[7:4]),.co(co));

endmodule