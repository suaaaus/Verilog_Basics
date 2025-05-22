module counter(clk, reset_n, op_clear, op_start, count, next_state, count1);
	input clk, reset_n;
	input op_clear, op_start;

	output reg [6:0] count;
	output reg [1:0] next_state;
	output [7:0] count1;

	
	wire [7:0] next_count;

	
	parameter IDLE = 2'b00;
	parameter BUSY = 2'b01;
	parameter END = 2'b10;	
	
	cla8 Uc0_cla8(.a(count), .b(8'b0000_0001), .ci(1'b0), .s(next_count), .co(x));
	
	always @(posedge clk or negedge reset_n) begin
	if(reset_n==0) begin
	count <= 7'b0000000;
	end
	
	else if(op_clear)  begin
	count <= 7'b0000000;
	end
	
	else if(op_start)  begin
	count <= next_count;
	end

	else if(count == 7'b1000000) begin
	count <= 7'b0000000;
	end
	end
	
	
	always @(count, next_state) begin
	case (count)
	7'b0000000 : next_state <= IDLE;
	7'b1000000 : next_state <= END;
	default : next_state <= BUSY;
	endcase
	end
	
	
	wire [7:0] count8bit;
	assign count8bit = {2'b00, count};



	cla8 Uc1_cla8(.a(count8bit), .b(8'b0000_0001), .ci(1'b0), .s(count1), .co(x5)); //count+1	
	

	endmodule 