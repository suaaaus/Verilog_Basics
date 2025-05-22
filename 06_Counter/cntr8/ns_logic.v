module ns_logic(load, inc, state, next_state);
	
	parameter IDLE_STATE= 3'b000;
	parameter LOAD_STATE= 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE= 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE= 3'b101;
	
	
	input load, inc;
	input [2:0] state;
	output [2:0] next_state;
	
	reg [2:0] next_state;
	
	always @(load, inc, state)
	begin
	case(state)

		IDLE_STATE : next_state <= 3'b00;
		LOAD_STATE : next_state <= load;
		INC_STATE : next_state <= INC_STATE;
		INC2_STATE : next_state <= INC2_STATE;
		DEC_STATE : next_state <= DEC_STATE;
		DEC2_STATE : next_state <= DEC2_STATE;
		default : next_state <= 3'bxx;
		endcase
	end
	
	

endmodule 