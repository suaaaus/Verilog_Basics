`timescale 1ns/100ps
module tb_ns_logic();

	reg q1, q1_bar, q0, q0_bar;
	reg Ta, Tb;
	wire d1, d0;

	ns_logic U_ns_logic(
	.Ta(Ta),
	.Tb(Tb),
	.d1(d1),
	.d0(d0),
	.q1(q1),
	.q0(q0),
	.q1_bar(q1_bar),
	.q0_bar(q0_bar)
	);
	
	
	initial begin

	q1=0; q0=0; Ta=0;	Tb=0; q1_bar=1;	q0_bar=1;
	#10 		Ta=1;
	#10 		q0=1;
	#10		q1=1; q0=0;
	#10		Tb=1;
	#10		q1=1;	q0=1;
	#10
	$finish;
	
	end
	
endmodule 