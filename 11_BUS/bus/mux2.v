module mux2(d0, d1, sel, y); //1bit mux2
	input d0, d1;
	input sel;
	output reg y;
	
	always @(sel, d0, d1)
		case (sel)
		1'b0 : y = d0;
		1'b1 : y = d1;
		default y = 1'bx;
		endcase
		
endmodule 