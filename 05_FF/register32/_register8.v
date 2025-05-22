module _register8(clk, d, q, q_bar);
	input	clk;
	input [7:0] d;
	output [7:0] q;
	output [7:0] q_bar;
	
	//instance of D FF
	_dff U_dff0(.clk(clk), .d(d[0]), .q(q[0]), .q_bar(q_bar[0]));
	_dff U_dff1(.clk(clk), .d(d[1]), .q(q[1]), .q_bar(q_bar[1]));
	_dff U_dff2(.clk(clk), .d(d[2]), .q(q[2]), .q_bar(q_bar[2]));
	_dff U_dff3(.clk(clk), .d(d[3]), .q(q[3]), .q_bar(q_bar[3]));
	_dff U_dff4(.clk(clk), .d(d[4]), .q(q[4]), .q_bar(q_bar[4]));
	_dff U_dff5(.clk(clk), .d(d[5]), .q(q[5]), .q_bar(q_bar[5]));
	_dff U_dff6(.clk(clk), .d(d[6]), .q(q[6]), .q_bar(q_bar[6]));
	_dff U_dff7(.clk(clk), .d(d[7]), .q(q[7]), .q_bar(q_bar[7]));
	
endmodule 