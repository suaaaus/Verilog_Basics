`timescale 1ns/1ns
module tb_fifo_ns();
	reg wr_en, rd_en, reset_n;
	reg [2:0] state;
	reg [3:0] data_count;
	wire [2:0] next_state;

fifo_ns	U_ns(
	.wr_en(wr_en), 
	.rd_en(rd_en), 
	.reset_n(reset_n), 
	.state(state), 
	.data_count(data_count), 
	.next_state(next_state)
	);
	
	
initial begin

		wr_en=1'b0; rd_en=1'b0; reset_n=0; state=3'b000; data_count=4'b0011;
		#30		 reset_n=1'b1; 
		#30		 wr_en=1'b1; rd_en=1'b0;
		#40		 wr_en=1'b0; rd_en=1'b1; data_count=4'b0001;
		#40 		 data_count =4'b0000;
		#40
		
	$finish;
	
	end
	
endmodule 