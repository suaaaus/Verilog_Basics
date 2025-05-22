module shifter(_mid_cal_ing, shift_mid);
input [127:0] _mid_cal_ing;
output reg [127:0] shift_mid;




 always @(*) begin
 if (_mid_cal_ing[127]==1)
	shift_mid={1'b1,_mid_cal_ing[127:1]};
	else
	shift_mid={1'b0,_mid_cal_ing[127:1]};
	end

endmodule 