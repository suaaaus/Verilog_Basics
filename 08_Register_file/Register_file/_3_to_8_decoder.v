module _3_to_8_decoder (d, q); // 3to 8 decoder module
	input [2:0] d;
	output reg [7:0] q;
	
	always@(d) begin
		case(d)
			3'b000: q = 8'b0000_0001;
			3'b001: q = 8'b0000_0010;
			3'b010: q = 8'b0000_0100;
			3'b011: q = 8'b0000_1000;
			3'b100: q = 8'b0001_0000;
			3'b101: q = 8'b0010_0000;
			3'b110: q = 8'b0100_0000;
			3'b111: q = 8'b1000_0000;
			default : q = 8'hx;
		endcase
	end
	
endmodule 