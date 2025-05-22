`timescale 1ns/100ps
module tb_o_logic();

	reg q1, q1_bar, q0, q0_bar;
	wire [1:0] La, Lb;


	o_logic U_o_logic(
	.La(La),
	.Lb(Lb),
	.q1(q1),
	.q0(q0),
	.q1_bar(q1_bar),
	.q0_bar(q0_bar)
	);
	
	
	initial begin

				q1=0; q0=0; q1_bar=1;	q0_bar=1;
	#10 		q1=0; q0=1; q1_bar=1;	q0_bar=0;
	#10 		q1=1; q0=0; q1_bar=0;	q0_bar=1;
	#10		q1=1; q0=1; q1_bar=0;	q0_bar=0;
	#10
	$finish;
	
	end
	
endmodule 