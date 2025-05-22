module _dff_en(clk, en, d, q, q_bar);
	input 	clk, en, d;
	output 	q, q_bar;
	
	wire		w_d;
	
	//instance
	mx2 U_mx2(.d0(q), .d1(d), .s(en), .y(w_d));
	_dff U_dff(.clk(clk), .d(w_d), .q(q), .q_bar(q_bar));
	
endmodule 