module mid_cal_ing(clk, reset_n, op_clear, _mid_add, _mid_cal_ing);
	input clk, reset_n, op_clear;
	input [127:0] _mid_add;
	output reg [127:0] _mid_cal_ing;
	

	
always @(posedge clk or negedge reset_n) begin
  if (reset_n == 0) 
    _mid_cal_ing = 128'h0;
  
  else if (op_clear== 0)
    _mid_cal_ing = _mid_add;
	else 
	 _mid_cal_ing =128'h0;
  end



endmodule 