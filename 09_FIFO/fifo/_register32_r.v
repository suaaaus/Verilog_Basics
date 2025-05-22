//32bits register

module _register32_r(clk, reset_n, d, q);
	input clk, reset_n;
	input [31:0] d;
	output [31:0] q;
	
//instance of _register4_r.v
	_register4_r U0_r32(.clk(clk), .reset_n(reset_n), .d(d[3:0]), .q(q[3:0]));
	_register4_r U1_r32(.clk(clk), .reset_n(reset_n), .d(d[7:4]), .q(q[7:4]));
	_register4_r U2_r32(.clk(clk), .reset_n(reset_n), .d(d[11:8]), .q(q[11:8]));
	_register4_r U3_r32(.clk(clk), .reset_n(reset_n), .d(d[15:12]), .q(q[15:12]));
	_register4_r U4_r32(.clk(clk), .reset_n(reset_n), .d(d[19:16]), .q(q[19:16]));
	_register4_r U5_r32(.clk(clk), .reset_n(reset_n), .d(d[23:20]), .q(q[23:20]));
	_register4_r U6_r32(.clk(clk), .reset_n(reset_n), .d(d[27:24]), .q(q[27:24]));
	_register4_r U7_r32(.clk(clk), .reset_n(reset_n), .d(d[31:28]), .q(q[31:28]));
	
endmodule 