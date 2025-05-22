module bus_addr(s_address, s0_sel, s1_sel);
	input [7:0] s_address;
	output reg s0_sel, s1_sel;

	
	//Slave 주소범위
	//✓ Slave1: 0x00~0x1F
	//✓ Slave2: 0x20~0x3F



wire [2:0] upper_3bit;
assign upper_3bit = s_address[7:5]; 

always @(*) begin
	if(upper_3bit == 3'b000) //8'b"000"1_1111=>(8'h00~8'h1f)
		{s0_sel, s1_sel} = 2'b10;

	else if(upper_3bit == 3'b001) //8'b"001"1_1111=(8'h20~8'h3f)
		{s0_sel, s1_sel} = 2'b01;

	else
		{s0_sel, s1_sel} = 2'b00;
end 

endmodule 