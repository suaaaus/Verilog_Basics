module frequency_divider(clk, en, control_signal, pulse, cnt, wmux, wDff, wpulse);
	input clk, en;
	input [7:0] control_signal;
	output pulse;
	
	output [7:0] cnt, wmux, wDff;
	output wpulse;

	
	
	mx2 U_mx2(.d0(cnt), .d1(8'b0000_0010), .sel(wpulse), .y(wmux)); 
	
	_8bitcounter_up U_8bitcounter_up(.count(1'b1), .load(wpulse), .init(wmux), .clk(clk), .en(en), .cnt(cnt));
	
	_8bit_D_ff U_8bit_D_ff(.clk(clk), .en(en), .d(cnt), .q(wDff));
	
	assign wpulse = (control_signal[0]~^wDff[0])&(control_signal[1]~^wDff[1])&(control_signal[2]~^wDff[2])&(control_signal[3]~^wDff[3])&(control_signal[4]~^wDff[4])&(control_signal[5]~^wDff[5])&(control_signal[6]~^wDff[6])&(control_signal[7]~^wDff[7]);
	
	
	_dff_r U_dff1(.clk(clk), .en(en), .d(wpulse), .q(pulse));
 
endmodule
