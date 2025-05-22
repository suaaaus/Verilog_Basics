`timescale 1ns/1ns
module tb_fifo_cal_addr();
	 reg [2:0] state, head, tail;
    reg [3:0] data_count;
    wire we, re;
    wire [2:0] next_head, next_tail;
    wire [3:0] next_data_count;

fifo_cal_addr U_fifo_cal_addr(
	.state(state), 
	.head(head), 
	.tail(tail), 
	.data_count(data_count), 
	.we(we), 
	.re(re),
	.next_head(next_head),
	.next_tail(next_tail),
	.next_data_count(next_data_count)
	);
	


	
	
initial begin

		state=0; head=0; tail=0; data_count=4'b0011;
		#30		 state=3'b010; 
		#40		 data_count=4'b0111;
		#40		 state=3'b100; 
		#40		 data_count=4'b0001;
		#40		 state=3'b101; data_count=4'b0000;
		
	$finish;
	
	end
	
endmodule 