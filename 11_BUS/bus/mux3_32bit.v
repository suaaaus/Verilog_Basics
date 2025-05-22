module mux3_32bit(d0, d1, sel, y); //32bits mux3
	input [31:0] d0, d1;
	input [2:0] sel;
	output reg [31:0] y;
	
	always @(sel, d0, d1)
		case (sel)
		3'b000 : y = d0;
		3'b001 : y = d1;
		default y = 32'h00;
		endcase
		
endmodule 