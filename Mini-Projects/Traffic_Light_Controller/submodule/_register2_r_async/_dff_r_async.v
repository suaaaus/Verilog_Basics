module _dff_r_async(clk, reset_n, d, q, q_bar);
	input clk, reset_n, d;
	output q, q_bar;
	reg q;

	
	always @(posedge clk or negedge reset_n) begin
	if(reset_n==0)	q<=1'b0;
	else	q<=d;
	end
	
	assign q_bar = ~q;
	
endmodule 