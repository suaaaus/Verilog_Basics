module _dff(clk, d, q, q_bar);
	input clk, d;
	output q, q_bar;
	wire clk_bar, w_q;
	
_inv		U_inv(.a(clk), .y(clk_bar));
_dlatch	U_dlatch1(.clk(clk_bar), .d(d), .q(w_q));
_dlatch	U_dlatch2(.clk(clk), .d(w_q), .q(q), .q_bar(q_bar));

endmodule 