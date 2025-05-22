module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, s0_dout, s1_dout, m0_grant, m1_grant, m_din, s0_sel, s1_sel, s_address, s_wr, s_din);
	input clk, reset_n;
	input m0_req, m0_wr, m1_req, m1_wr;
	input	[7:0] m0_address, m1_address;
	input [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	output m0_grant, m1_grant;
	output [31:0] m_din, s_din;
	output s0_sel, s1_sel;
	output [7:0] s_address;
	output s_wr;

	wire [2:0] upper_3bit, d_sel_mx3;
	
	bus_arbit U0_arbit(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant), .next_state(sel_mx2));
	
	mux2 U0_mx2(.d0(m0_wr), .d1(m1_wr), .sel(sel_mx2), .y(s_wr));
	
	mux2_8bit U0_mx2_8bit(.d0(m0_address), .d1(m1_address), .sel(sel_mx2), .y(s_address));
	
	mux2_32bit U0_mx2_32bit(.d0(m0_dout), .d1(m1_dout), .sel(sel_mx2), .y(s_din)); 
	
	bus_addr U0_bus_addr(.s_address(s_address), .upper_3bit(upper_3bit), .s0_sel(s0_sel), .s1_sel(s1_sel));
	
	mux3_32bit U0_mx3_32bit(.d0(s0_dout), .d1(s1_dout), .sel(d_sel_mx3), .y(m_din));
	
	_dff_3bit U_dff(.clk(clk), .reset_n(reset_n), .d(upper_3bit), .q(d_sel_mx3)); 
	
endmodule 