//2-bit resettable register with active low asynchronous reset module

module _register2_r_async(clk, reset_n, d1, d0, q1, q0, q1_bar, q0_bar);
	input d1, d0;
	input clk, reset_n;
	output q1, q0, q1_bar, q0_bar;

//2bits resettable register
	_dff_r_async U1_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d1), .q(q1), .q_bar(q1_bar));
	_dff_r_async U0_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d0), .q(q0), .q_bar(q0_bar));
	
endmodule
