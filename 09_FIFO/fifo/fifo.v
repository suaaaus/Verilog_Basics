module fifo (clk, reset_n, rd_en, wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	input clk, reset_n, rd_en, wr_en;
	input [31:0] d_in;
	output [31:0] d_out;
	output full, empty, wr_ack, wr_err, rd_ack, rd_err;
	output [3:0] data_count;
	
	wire [2:0] nslogic_next_state;
	wire [2:0] r_state, r_head, r_tail;
	wire [2:0] cal_head, cal_tail;
	wire [3:0] cal_data_count;
	wire [31:0] rData;
	wire [31:0]	w_mx2;
	wire we, re;

	
	fifo_ns U_nextstate(.wr_en(wr_en), .rd_en(rd_en), .reset_n(reset_n), .state(r_state), .data_count(data_count), .next_state(nslogic_next_state));
	
	fifo_cal_addr U_cal_addr(.state(nslogic_next_state), .head(r_head), .tail(r_tail), .data_count(data_count), .we(we), .re(re), .next_head(cal_head), .next_tail(cal_tail), .next_data_count(cal_data_count));
	
	_register3_r U_register3_state(.clk(clk), .reset_n(reset_n), .d(nslogic_next_state), .q(r_state)); //state
	_register3_r U_register3_head(.clk(clk), .reset_n(reset_n), .d(cal_head), .q(r_head)); //head
	_register3_r U_register3_tail(.clk(clk), .reset_n(reset_n), .d(cal_tail), .q(r_tail)); //tail
	_register4_r U_register4_data_count(.clk(clk), .reset_n(reset_n), .d(cal_data_count), .q(data_count)); //data_count
	
	
	fifo_out U_output(.state(r_state), .data_count(data_count), .full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err));
	
	Register_file U_RgFile(.clk(clk), .reset_n(reset_n), .wAddr(r_tail), .wData(d_in), .we(we), .rAddr(r_head), .rData(rData));

	mx2 U_mux2(.d0(32'h00), .d1(rData), .sel(re), .y(w_mx2));
	
	_register32_r U_register32_dout(.clk(clk), .reset_n(reset_n), .d(w_mx2), .q(d_out));
	
endmodule 