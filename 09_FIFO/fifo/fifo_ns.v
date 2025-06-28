module fifo_ns(wr_en, rd_en, state, data_count, next_state);
    input wr_en, rd_en;
    input [2:0] state;
    input [3:0] data_count;
    output reg [2:0] next_state;

    parameter INIT = 3'b000;
    parameter NO_OP = 3'b001;
    parameter WRITE = 3'b010;
    parameter WR_ERROR = 3'b011;
    parameter READ = 3'b100;
    parameter RD_ERROR = 3'b101;
    

    //extern : wr_en, rd_en
    //intern : state, data_count
    // --> next state
    always@(*)begin
        case({wr_en, rd_en})
            {1'b1, 1'b1} : next_state = NO_OP;
            {1'b0, 1'b0} : next_state = NO_OP;
            {1'b1, 1'b0} : next_state = (data_count < 4'b1000) ? WRITE : WR_ERROR;
            {1'b0, 1'b1} : next_state = (data_count > 4'b0000) ? READ : RD_ERROR;
        endcase
    end
 
endmodule 