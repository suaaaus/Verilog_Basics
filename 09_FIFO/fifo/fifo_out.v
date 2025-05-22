module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);
	input [2:0] state;
	input [3:0] data_count;
	output reg full, empty;
	output reg wr_ack, wr_err, rd_ack, rd_err; //handshake signal
	
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b010;
	parameter WR_ERROR = 3'b011;
	parameter READ = 3'b100;
	parameter RD_ERROR = 3'b101;
	
 always @ (data_count, empty, full)
    begin
        case(data_count)
            4'b0000: begin
                empty = 1'b1;
                full = 1'b0;
            end
            4'b1000: begin
                empty = 1'b0;
                full = 1'b1;
            end

            default: begin
                empty = 1'b0;
                full = 1'b0;
            end
        endcase
		  end
		
		
		
	always @ (state, wr_ack, wr_err, rd_ack, rd_err)
    begin
        case(state)
            INIT: begin
                wr_ack = 1'b0;
                wr_err = 1'b0;
                rd_ack = 1'b0;
                rd_err = 1'b0;
            end
            NO_OP: begin
                wr_ack = 1'b0;
                wr_err = 1'b0;
                rd_ack = 1'b0;
                rd_err = 1'b0;
            end
            WRITE: begin
                wr_ack = 1'b1;
                wr_err = 1'b0;
                rd_ack = 1'b0;
                rd_err = 1'b0;
            end
            WR_ERROR: begin
                wr_ack = 1'b0;
                wr_err = 1'b1;
                rd_ack = 1'b0;
                rd_err = 1'b0;
            end
            READ: begin
                wr_ack = 1'b0;
                wr_err = 1'b0;
                rd_ack = 1'b1;
                rd_err = 1'b0;
            end
            RD_ERROR: begin
                wr_ack = 1'b0;
                wr_err = 1'b0;
                rd_ack = 1'b0;
                rd_err = 1'b1;
            end
            default: begin
                wr_ack = 1'bx;
                wr_err = 1'bx;
                rd_ack = 1'bx;
                rd_err = 1'bx;
            end
        endcase
		  end
		
endmodule 