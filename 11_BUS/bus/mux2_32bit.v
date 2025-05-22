module mux2_32bit(d0, d1, sel, y);  //32bits mux2
	input [31:0] d0, d1;
	input sel;
	output reg [31:0] y;
	
	always @(sel, d0, d1)
		case (sel)
		1'b0 : y = d0;
		1'b1 : y = d1;
		default y = 32'hxxxx_xxxx;
		endcase
		
endmodule 