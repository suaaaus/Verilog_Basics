module _8bit_D_ff(clk, en, d, q); //8bit DFF
	input clk, en;
	input [7:0] d;
	output [7:0] q;
	

	_dff_r U0_dff_r(.clk(clk), .en(en), .d(d[0]), .q(q[0]));
	_dff_r U1_dff_r(.clk(clk), .en(en), .d(d[1]), .q(q[1]));
	_dff_r U2_dff_r(.clk(clk), .en(en), .d(d[2]), .q(q[2]));
	_dff_r U3_dff_r(.clk(clk), .en(en), .d(d[3]), .q(q[3]));
	_dff_r U4_dff_r(.clk(clk), .en(en), .d(d[4]), .q(q[4]));
	_dff_r U5_dff_r(.clk(clk), .en(en), .d(d[5]), .q(q[5]));
	_dff_r U6_dff_r(.clk(clk), .en(en), .d(d[6]), .q(q[6]));
	_dff_r U7_dff_r(.clk(clk), .en(en), .d(d[7]), .q(q[7]));

endmodule 