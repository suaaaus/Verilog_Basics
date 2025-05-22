module multiplier(clk, reset_n, multiplicand, multiplier, op_start, op_clear, op_done, result);
	input clk, reset_n;
	input [63:0] multiplicand, multiplier;
	input op_start, op_clear;
	output op_done;
	output [127:0] result;
	

	
	wire [6:0] count;
	wire [7:0] count1;
	wire [1:0] next_state;
	wire [1:0] _xcount;
	wire [127:0] _mid_add, add, _mid_cal_ing, shift_mid;

	
	counter U0_count(.clk(clk), .reset_n(reset_n), .op_clear(op_clear), .op_start(op_start), .count(count), .next_state(next_state), .count1(count1));
	
	X_count U0_xcount(.count(count), .count1(count1), .multiplier(multiplier), ._xcount(_xcount));
	
	add U_add(.multiplicand(multiplicand), ._xcount(_xcount), .add(add));
	
	cla128 U0_cla128(.a(add), .b(shift_mid), .ci(1'b0), .co(y), .s(_mid_add));
	
	mid_cal_ing U_midcal(.clk(clk), .reset_n(reset_n), .op_clear(op_clear), ._mid_add(_mid_add), ._mid_cal_ing(_mid_cal_ing));
	
	shifter U_shift(._mid_cal_ing(_mid_cal_ing), .shift_mid(shift_mid));
	
	o_logic U_ologic(.state(next_state), ._mid_cal_ing(shift_mid), .op_done(op_done), .result(result));
	
endmodule 