//4bits register

module _register4_r(clk, reset_n, d, q);
	input clk, reset_n;
	input [3:0] d;
	output [3:0] q;
	
//instance of resettable D FF
	_dff_r U3_dff_r(.clk(clk), .reset_n(reset_n), .d(d[0]), .q(q[0]));
	_dff_r U4_dff_r(.clk(clk), .reset_n(reset_n), .d(d[1]), .q(q[1]));
	_dff_r U5_dff_r(.clk(clk), .reset_n(reset_n), .d(d[2]), .q(q[2]));
	_dff_r U6_dff_r(.clk(clk), .reset_n(reset_n), .d(d[3]), .q(q[3]));
	
endmodule 