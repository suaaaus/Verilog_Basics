//Combinational logic by FSM encoded state transition table
module ns_logic (q2, q1, q0, Ta, Tal, Tb, Tbl, d2, d1, d0);

	input q2, q1, q0;
	input Ta, Tb;
	input Tal, Tbl;
	output d2, d1, d0;

	wire w0, w1, w2, w3;
	wire w4;
	wire w5, w6, w7;
	
	

	_and4 u0_and4(.a(~q0), .b(~q1), .c(~q2), .d(~Ta), .y(w0));
	_and4 u1_and4(.a(~q0), .b(q1), .c(~q2), .d(~Tal), .y(w1));
	_and4 u2_and4(.a(~q0), .b(~q1), .c(q2), .d(Tb), .y(w2));
	_and4 u3_and4(.a(~q0), .b(q1), .c(q2), .d(~Tbl), .y(w3));
	
	_or4 u0_or4(.a(w0),.b(w1),.c(w2),.d(w3),.y(d0));		//D0
	
	
	_xor2 u0_xor2(.a(q2),.b(q1),.y(w4));
	_xor2 u1_xor2(.a(w4),.b(q0),.y(d1));						//D1
	
	
	_and2 u0_and2(.a(q2), .b(invq1), .y(w5));
	_and3 u0_and3(.a(~q2), .b(q1), .c(q0), .y(w6));
	_and3 u1_and3(.a(q2), .b(q1), .c(~q0), .y(w7));
	_or3 u0_or3(.a(w5),.b(w6),.c(w7),.y(d2));					//D2
	
	
endmodule 