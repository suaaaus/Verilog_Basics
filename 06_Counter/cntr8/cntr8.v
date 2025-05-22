module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state);
	input clk, reset_n, inc, load;
	input [7:0] d_in;
	output [7:0] d_out;
	output [2:0] o_state;
	wire [2:0] next_state;
	wire [2:0] state;

	assign o_state = state;

	//Instances of register, next state logic, output logic
	_register3_r U_register3_r(.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
	ns_logic U_ns_logic(.load(load), .inc(inc), .state(state), .next_state(next_state));
	os_logic U_os_logic(.state(state), .d_in(d_in), .d_out(d_out));

endmodule

