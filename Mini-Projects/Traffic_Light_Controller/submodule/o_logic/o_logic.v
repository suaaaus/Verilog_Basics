// combinational logic by FSM output table

module o_logic(q1, q1_bar, q0, q0_bar, La, Lb);
	input q1, q1_bar, q0, q0_bar;
	output [1:0] La, Lb;
	
	assign La[1]=q1;
	assign Lb[1]=q1_bar;
	
	_and2 U0_and2(.a(q1_bar), .b(q0), .y(La[0]));
	_and2 U1_and2(.a(q1), .b(q0), .y(Lb[0]));
	
endmodule 