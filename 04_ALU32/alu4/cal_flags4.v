module cal_flags4(op, result, co_add, c3_add, c, n, z, v);
	input [2:0] op;
	input [3:0] result;
	input co_add, c3_add;
	output c, n, z, v;
	
	//assign using conditional operator
	
	assign c = (op[2:1] != 2'b11) ? 1'b0 : co_add; //c:carry
																  //if op[2:1] = 2'b11, T:1'b0 /	F:co_add
	
	assign n = result[3]; //MSB of the result :negative
	
	assign z = (result == 4'b0) ? 1'b1 : 1'b0;				//z:zero
	
	assign v = (op[2:1] != 2'b11) ? 1'b0 : co_add ^ c3_add; //v:overflow

	
endmodule

