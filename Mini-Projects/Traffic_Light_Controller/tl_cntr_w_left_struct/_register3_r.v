//3-bit resettable register with active low asynchronous reset module

module _register3_r(clk, reset_n, d2, d1, d0, q2, q1, q0);
	input d2, d1, d0;
	input clk, reset_n;
	output q2, q1, q0;

//3bits resettable register
	_dff_r_async U0_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d0), .q(q0));
	_dff_r_async U1_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d1), .q(q1));
	_dff_r_async U2_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d2), .q(q2));
	
endmodule 