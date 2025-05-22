//Combinational logic by FSM encoded state transition table
module ns_logic (q1, q1_bar, q0, q0_bar, Ta, Tb, d1, d0);

	input q1, q1_bar, q0, q0_bar;
	input Ta, Tb;
	output d1, d0;
	wire in1, in2;
	wire w1, w2;
	
	_inv U0_inv(.a(Ta),.y(in1)); //in1=Ta_bar
	_inv U1_inv(.a(Tb),.y(in2)); //in2=Tb_bar
	
	_xor2 U0_xor2(.a(q1),.b(q0),.y(d1)); //D1=Q1xorQ0
	_and3 U0_and3(.a(q1_bar), .b(q0_bar), .c(in1), .y(w1));
	_and3 U1_and3(.a(q1), .b(q0_bar), .c(in2), .y(w2));
	
	_or2 U_or2(.a(w1), .b(w2), .y(d0));
	
endmodule 