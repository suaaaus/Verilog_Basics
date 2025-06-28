module fifo_cal(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);
    input [2:0] state, head, tail;
    input [3:0] data_count;
    output reg we, re;
    output reg [2:0] next_head, next_tail;
    output reg [3:0] next_data_count;
    
    parameter INIT = 3'b000;
    parameter NO_OP = 3'b001;
    parameter WRITE = 3'b010;
    parameter WR_ERROR = 3'b011;
    parameter READ = 3'b100;
    parameter RD_ERROR = 3'b101;
    
    
    always@(*)begin
        case(state)
            INIT : begin
                next_head = head;
                next_tail = tail;
                next_data_count = data_count;
                we = 1'b1;
                re = 1'b1;
            end
            
            NO_OP : begin
                next_head = head;
                next_tail = tail;
                next_data_count = data_count;
                we = 1'b1;
                re = 1'b1;
            end
            
            WRITE : begin
                next_head = head;
                next_tail = tail+3'b001;
					 if (data_count < 4'b1000)
                next_data_count = data_count+4'b0001;
					 else 
					 next_data_count = 4'b1000;
					 
                we = 1'b1;
                re = 1'bx;
            end
            
            WR_ERROR : begin
                next_head = head;
                next_tail = tail;
                next_data_count = 4'b1000;
                we = 1'b0;
                re = 1'bx;
            end
            
            READ : begin
                next_head = head+3'b001;
                next_tail = tail;
                next_data_count = data_count-4'b0001;
                re = 1'b1;
                we = 1'bx;
            end
            
            RD_ERROR : begin
                next_head = head;
                next_tail = tail;
                next_data_count = 4'b0000;
                re = 1'b0;
                we = 1'bx;
            end
            
            default : begin
                next_head = 3'bxxx;
                next_tail = 3'bxxx;
                next_data_count = 4'bxxxx;
                we = 1'bx;
                re = 1'bx;
            end
                
            endcase
    end

endmodule
