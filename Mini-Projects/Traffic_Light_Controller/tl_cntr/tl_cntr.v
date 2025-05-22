module tl_cntr(clk, reset_n, Ta, Tb, La, Lb);

	input clk, reset_n;
	input Ta, Tb;
	output [1:0] La, Lb;
	
	wire d1, d0;
	reg q1, q0;
	
	
	
	assign d1=q1^q0;
	assign d0=~q1&~q0&~Ta|q1&~q0&~Tb;
	
	
	always @(posedge clk or negedge reset_n) begin
	if(reset_n==0)	q1<=1'b0;
	else	q1<=d1;
	end
	

	
	always @(posedge clk or negedge reset_n) begin
	if(reset_n==0)	q0<=1'b0;
	else	q0<=d0;
	end
	
	
	assign La[1]=q1;
	assign La[0]=~q1&q0;
	assign Lb[1]=~q1;
	assign Lb[0]=q1&q0;

endmodule
