module LSR8(d_in, shamt, d_out);
	input [7:0] d_in;
	input [1:0] shamt;
	output [7:0] d_out;

	mx4 Ur7_mx4(.y(d_out[7]), .d0(d_in[7]), .d1(1'b0), .d2(1'b0), .d3(1'b0), .s(shamt));
	mx4 Ur6_mx4(.y(d_out[6]), .d0(d_in[7]), .d1(d_in[6]), .d2(1'b0), .d3(1'b0), .s(shamt));
	mx4 Ur5_mx4(.y(d_out[5]), .d0(d_in[7]), .d1(d_in[6]), .d2(d_in[5]), .d3(1'b0), .s(shamt));
	mx4 Ur4_mx4(.y(d_out[4]), .d0(d_in[7]), .d1(d_in[6]), .d2(d_in[5]), .d3(d_in[4]), .s(shamt));
	mx4 Ur3_mx4(.y(d_out[3]), .d0(d_in[6]), .d1(d_in[5]), .d2(d_in[4]), .d3(d_in[3]), .s(shamt));
	mx4 Ur2_mx4(.y(d_out[2]), .d0(d_in[5]), .d1(d_in[4]), .d2(d_in[3]), .d3(d_in[2]), .s(shamt));
	mx4 Ur1_mx4(.y(d_out[1]), .d0(d_in[4]), .d1(d_in[3]), .d2(d_in[2]), .d3(d_in[1]), .s(shamt));
	mx4 Ur0_mx4(.y(d_out[0]), .d0(d_in[3]), .d1(d_in[2]), .d2(d_in[1]), .d3(d_in[0]), .s(shamt));



endmodule
