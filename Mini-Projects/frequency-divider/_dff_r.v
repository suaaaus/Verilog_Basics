module _dff_r(clk, en, d, q);
	input clk, en, d;
	output reg q;
	
	always@(posedge clk)
	if (en)
	begin
	q <= d;
	end

endmodule 