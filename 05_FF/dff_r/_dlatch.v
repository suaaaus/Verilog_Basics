module _dlatch(clk, d, q, q_bar);
	input clk;
	input d;
	output q, q_bar;
	reg q;
	
	always @(clk or d) 
	begin
		if(clk == 1) q <= d;
	end
	
	assign q_bar = ~q;

endmodule 