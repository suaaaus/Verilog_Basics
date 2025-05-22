`timescale 1ns/100ps

module tb_fa;
reg a, b, ci;
wire s, co;
	
	ha ha1(.s(sm), .co(c1), .a(b), .b(ci));
	ha ha2(.s(s), .co(c2), .a(a), .b(sm));
	_or2 or1(.y(co), .a(c1), .b(c2));
	

initial
begin

			a=0;	b=0;	ci=0;
	#10;	a=0;	b=0;	ci=1;
	#10;	a=0;	b=1;	ci=0;
	#10;	a=0;	b=1;	ci=1;
	#10;	a=1;	b=0;	ci=0;
	#10;	a=1;	b=0;	ci=1;
	#10;	a=1;	b=1;	ci=0;
	#10;	a=1;	b=1;	ci=1;	
		
		
end

endmodule



