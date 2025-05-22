module ASR8(d_in, shamt, d_out); //arithmetic shift right
	input [7:0] d_in;
	input [1:0] shamt;
	output [7:0] d_out;

	mx4 U_ar7_mx4(.y(d_out[7]), .d0(d_in[7]), .d1(d_in[7]), .d2(d_in[7]), .d3(d_in[7]), .s(shamt));
	mx4 U_ar6_mx4(.y(d_out[6]), .d0(d_in[7]), .d1(d_in[6]), .d2(d_in[7]), .d3(d_in[7]), .s(shamt));
	mx4 U_ar5_mx4(.y(d_out[5]), .d0(d_in[7]), .d1(d_in[6]), .d2(d_in[5]), .d3(d_in[7]), .s(shamt));
	mx4 U_ar4_mx4(.y(d_out[4]), .d0(d_in[7]), .d1(d_in[6]), .d2(d_in[5]), .d3(d_in[4]), .s(shamt));
	mx4 U_ar3_mx4(.y(d_out[3]), .d0(d_in[6]), .d1(d_in[5]), .d2(d_in[4]), .d3(d_in[3]), .s(shamt));
	mx4 U_ar2_mx4(.y(d_out[2]), .d0(d_in[5]), .d1(d_in[4]), .d2(d_in[3]), .d3(d_in[2]), .s(shamt));
	mx4 U_ar1_mx4(.y(d_out[1]), .d0(d_in[4]), .d1(d_in[3]), .d2(d_in[2]), .d3(d_in[1]), .s(shamt));
	mx4 U_ar0_mx4(.y(d_out[0]), .d0(d_in[3]), .d1(d_in[2]), .d2(d_in[1]), .d3(d_in[0]), .s(shamt));
	
endmodule 