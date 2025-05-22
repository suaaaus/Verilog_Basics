module tl_cntr_w_left_struct(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);
	input clk, reset_n;
	input Ta, Tal, Tb, Tbl;
	output [1:0] La, Lb;
	
	wire q2, q1, q0;
	wire d2, d1, d0;
	
	ns_logic U_ns_logic(.q2(q2), .q1(q1), .q0(q0), .Ta(Ta), .Tal(Tal), .Tb(Tb), .Tbl(Tbl), .d2(d2), .d1(d1), .d0(d0));
	_register3_r U_register3_r(.clk(clk), .reset_n(reset_n), .d2(d2), .d1(d1), .d0(d0), .q2(q2), .q1(q1), .q0(q0));
	o_logic U_o_logic(.q2(q2), .q1(q1), .q0(q0), .La(La), .Lb(Lb));

endmodule 