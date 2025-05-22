module o_logic(state, _mid_cal_ing, op_done, result);

	input [1:0] state;
	input [127:0] _mid_cal_ing;
	output reg op_done;
	output reg [127:0] result;

	parameter IDLE = 2'b00;
	parameter BUSY = 2'b01;
	parameter END = 2'b10;
	

	
	always @(state, result, _mid_cal_ing, op_done)
    begin
        case(state)
            IDLE: begin
					 result <= _mid_cal_ing;
					 op_done <= 1'b0;
            end
				
            BUSY: begin             
					 result <= _mid_cal_ing;					 
					 op_done <= 1'b0;
            end
				
            END: begin                
					 result <= _mid_cal_ing;
					 op_done <= 1'b1;
            end
     
            default: begin
					result <= 128'hxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx;
               op_done <= 1'bx;
            end
        endcase
		  end
	
	
	
	endmodule 