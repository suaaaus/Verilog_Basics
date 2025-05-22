module _dff_r (clk, reset_n, d, q, q_bar);
	input clk, reset_n, d;
	output q, q_bar;
	
	wire w_d;
	
	//instance
	_and2 U_and2(.a(d), .b(reset_n), .y(w_d));
	_dff 	U_dff(.clk(clk), .d(w_d), .q(q), .q_bar(q_bar));
	
endmodule 