// combinational logic by FSM output table

module o_logic(q2, q1, q0, La, Lb);
	input q2, q1, q0;
	output [1:0] La, Lb;

	wire w1;
	
	_and2 U0_and2(.a(~q0), .b(q1), .y(w1)); 
	_or2 U0_or2(.a(w1), .b(q2), .y(La[1]));			//La[1]
	
	_or2 U1_or2(.a(q0), .b(q2), .y(La[0]));			//La[0]	
	
	_or2 U2_or2(.a(w1), .b(~q2), .y(Lb[1]));		//Lb[1]
	
	_or2 U3_or2(.a(q0), .b(~q2), .y(Lb[0]));		//Lb[0]
 
	
endmodule 