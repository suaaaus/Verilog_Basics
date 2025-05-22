module shifter8(clk, reset_n, op, shamt, d_in, d_out, d_next);
	input clk, reset_n;
	input [2:0] op;
	input [1:0] shamt;
	input [7:0] d_in;
	output  [7:0] d_out;
	output  [7:0] d_next;


	
	//8bits register, combinational cicuit instance
	_register8_r U_register8_r(.clk(clk), .reset_n(reset_n), .d(d_next), .q(d_out));
	cc_logic U_cc_logic(.op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out), .d_next(d_next));
	
	
	
	endmodule 