module tl_cntr_w_left(clk, reset_n, Ta, Tal, Tb, Tbl, La, Lb);

	input clk, reset_n;
	input Ta, Tal, Tb, Tbl;
	output [1:0] La, Lb;
	
	wire d2, d1, d0;
	reg q2, q1, q0;
	
	
	
	assign d2=(~q2&q1&q0)|(q2&~q1)|(q2&q1&~q0);
	assign d1=q2^q1^q0;
	assign d0=(~q2&~q1&~q1&~Ta)|(~q2&q1&~q0&~Tal)|(q2&~q1&~q0&~Tb)|(q2&q1&~q0&~Tbl);
	
	always @(posedge clk or negedge reset_n) begin
	if(reset_n==0)	q2<=1'b0;
	else	q2<=d2;
	end
	
	always @(posedge clk or negedge reset_n) begin
	if(reset_n==0)	q1<=1'b0;
	else	q1<=d1;
	end
	

	
	always @(posedge clk or negedge reset_n) begin
	if(reset_n==0)	q0<=1'b0;
	else	q0<=d0;
	end
	
	
	
	assign La[1]=q2|(q1&~q0);
	assign La[0]=q2|q0;
	assign Lb[1]=~q2|(q1&~q0);
	assign Lb[0]=q0|~q2;

endmodule
