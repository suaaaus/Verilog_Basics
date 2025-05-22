`timescale 1ns/100ps

module tb_ha;

reg a;
reg b;
wire s;
wire co;

	_and2 and1 (.y(co), .a(a), .b(b));
	_xor2 xor1 (.y(s), .a(a), .b(b));


initial

begin
			a=0;	b=0;
	#10;	a=0;	b=1;
	#10;	a=1;	b=0;
	#10;	a=1;	b=1;
	#10;	
end

endmodule
