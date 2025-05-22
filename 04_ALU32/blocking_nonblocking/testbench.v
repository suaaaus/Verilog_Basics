`timescale 1ns/100ps
module testbench();
	reg clk;
	reg a;
	wire b, c, d, e;
	
	blocking_and_nonblocking u_blocking_and_nonblocking (
	.clk(clk), 
	.a(a),
	.b(b),
	.c(c),
	.d(d),
	.e(e)
	);
	
always #5 clk=~clk;

initial begin
clk=0;
a=0;
#10; a=1;
#50;
#10; a=0;
#50;
#10; a=1;
#50
$finish;
end
 
 

 endmodule 