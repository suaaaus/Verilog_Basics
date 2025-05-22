module tl_cntr_struct (clk, reset_n, Ta, Tb, La, Lb);
input clk, reset_n;
input Ta, Tb; //traffic sensor
output [1:0] La, Lb; //traffic light
wire q1, q1_bar, q0, q0_bar;
wire d1, d0;

//instance module next state logic 
	ns_logic U_ns_logic(.q1(q1), .q1_bar(q1_bar), .q0(q0), .q0_bar(q0_bar), .Ta(Ta), .Tb(Tb), .d1(d1), .d0(d0));
	_register2_r_async U_register2(.clk(clk), .reset_n(reset_n), .d1(d1), .d0(d0), .q1(q1), .q0(q0), .q1_bar(q1_bar), .q0_bar(q0_bar));
	o_logic U_o_logic(.q1(q1), .q1_bar(q1_bar), .q0(q0), .q0_bar(q0_bar), .La(La), .Lb(Lb));
	
endmodule 