module mx2(d0, d1, sel, y); //8bits mux2
	
	input [7:0] d0, d1;
	input sel;
	output reg [7:0] y;
	
	always @(sel, d0, d1)
		case (sel)
		1'b0 : y = d0;
		1'b1 : y = d1;
		default y = 8'bxxxx_xxxx;
		endcase
endmodule
