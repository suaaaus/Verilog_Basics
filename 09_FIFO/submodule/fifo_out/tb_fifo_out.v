`timescale 1ns/1ns
module tb_fifo_out();
	reg [2:0] state;
	reg [3:0] data_count;
	wire full, empty;
	wire wr_ack, wr_err, rd_ack, rd_err; //handshake signal

fifo_out U_fifo_out(
	.state(state), 
	.data_count(data_count), 
	.full(full), 
	.empty(empty), 
	.wr_ack(wr_ack), 
	.wr_err(wr_err), 
	.rd_ack(rd_ack), 
	.rd_err(rd_err)
	);
	
	
initial begin

					state=3'b001; data_count=4'b0010;
		#30		state=3'b100;
		#30		state=3'b101; data_count=4'b0000;
		#40		state=3'b010;
		#40 		data_count=4'b0111;
		#40		data_count=4'b1000;
		#40
		
	$finish;
	
	end
	
endmodule 