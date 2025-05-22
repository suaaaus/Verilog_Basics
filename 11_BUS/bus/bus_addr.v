module bus_addr(s_address, upper_3bit, s0_sel, s1_sel);
	input [7:0] s_address;
	output [2:0] upper_3bit;
	output reg s0_sel, s1_sel;


assign upper_3bit = s_address[7:5]; 

always @(*) begin
	if(upper_3bit == 3'b000) 
		{s0_sel, s1_sel} = 2'b10;

	else if(upper_3bit == 3'b001) 
		{s0_sel, s1_sel} = 2'b01;

	else
		{s0_sel, s1_sel} = 2'b00;
end 

endmodule 