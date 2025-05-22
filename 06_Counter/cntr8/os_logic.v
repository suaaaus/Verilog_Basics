module os_logic (state, d_in, d_out);
	
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b000;
	parameter INC_STATE = 3'b000;
	parameter INC2_STATE = 3'b000;
	parameter DEC_STATE = 3'b000;
	parameter DEC2_STATE = 3'b000;
	
	input [2:0] state;
	input [7:0] d_in;
	output [7:0] d_out;
	reg [7:0] d_out;
	wire [7:0] d_inc;
	wire [7:0] d_dec;
	
	
	always @(state, d_in) begin
		case(state)
		IDLE_STATE : d_out <= 8'h00;
		LOAD_STATE : d_out <= d_in;
		INC_STATE : d_out <= d_inc;
		INC2_STATE : d_out <= d_inc;
		DEC_STATE : d_out <= d_dec;
		DEC2_STATE : d_out <= d_dec;
		default : d_out <= 8'hxx;
		endcase
	end
	
	
	cla8 U0_cla8(.a(d_in), .b(state), .ci(), .s(d_inc), .co());
	cla8 U1_cla8(.a(d_in), .b(state), .ci(), .s(d_dec), .co());

endmodule
