	//next state logic
	// Next state logic: 외부로 wr_en과 rd_en을 받고 내부에서 현재 state와 data_count를 받아 다음 state를 출력
	
module fifo_ns(wr_en, rd_en, reset_n, state, data_count, next_state);
	input wr_en, rd_en, reset_n;
	input [2:0] state;
	input [3:0] data_count;
	output reg [2:0] next_state;

	
	parameter INIT = 3'b000;
	parameter NO_OP = 3'b001;
	parameter WRITE = 3'b010;
	parameter WR_ERROR = 3'b011;
	parameter READ = 3'b100;
	parameter RD_ERROR = 3'b101;
	
	
	always @(reset_n, rd_en, wr_en, data_count, next_state)
	begin
		if (reset_n == 0) begin
        next_state = INIT;
		end
		else begin
        if ((!wr_en && !rd_en) || (wr_en && rd_en))
            next_state = NO_OP;
        else if (wr_en && (data_count < 4'b1000))
            next_state = WRITE;
        else if (wr_en && (data_count >= 4'b1000))
            next_state = WR_ERROR;
        else if (rd_en && (data_count > 4'b0000))
            next_state = READ;
        else if (rd_en && (data_count == 4'b0000))
            next_state = RD_ERROR;
	end 
	end

endmodule 