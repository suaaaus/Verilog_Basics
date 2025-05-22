`timescale 1ns/1ns
module tb_bus();
	reg clk, reset_n;
	reg m0_req, m0_wr, m1_req, m1_wr;
	reg [7:0] m0_address, m1_address;
	reg [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	wire m0_grant, m1_grant;
	wire [31:0] m_din, s_din;
	wire s0_sel, s1_sel;
	wire [7:0] s_address;
	wire s_wr;
	
	bus U_bus(.clk(clk),
				 .reset_n(reset_n), 
				 .m0_req(m0_req), 
				 .m0_wr(m0_wr), 
				 .m0_address(m0_address), 
				 .m0_dout(m0_dout), 
				 .m1_req(m1_req), 
				 .m1_wr(m1_wr), 
				 .m1_address(m1_address), 
				 .m1_dout(m1_dout), 
				 .s0_dout(s0_dout), 
				 .s1_dout(s1_dout), 
				 .m0_grant(m0_grant), 
				 .m1_grant(m1_grant), 
				 .m_din(m_din), 
				 .s0_sel(s0_sel), 
				 .s1_sel(s1_sel), 
				 .s_address(s_address), 
				 .s_wr(s_wr), 
				 .s_din(s_din));
	
	always #10 clk=~clk;
	initial
	begin
		   	clk=1'b0; reset_n=1'b0; m0_req=1'b0; m0_wr=1'b0; m1_req=1'b0; m1_wr=1'b0; m0_address=8'h0; m1_address=8'h0; m0_dout=32'h0; m1_dout=32'h0; s0_dout=32'h0; s1_dout=32'h0;
		#15   reset_n=1'b1; 
		#20	m1_req=1'b1; s0_dout=32'h0000_aaaa; s1_dout=32'h0000_bbbb;
		#20	m1_wr=1'b1;
		#20	m1_address=8'h21;	m1_dout=32'h2100_0000;
		#20	m1_address=8'h22;	m1_dout=32'h2200_0000;
		#20   m1_address=8'h23;	m1_dout=32'h2300_0000;
		#20	m1_address=8'h24;	m1_dout=32'h2400_0000;
		#20	m1_address=8'h19;	m1_dout=32'h1900_0000;	
		#20	m1_address=8'h18; m1_dout=32'h1800_0000;
		#20	m1_address=8'h17; m1_dout=32'h1700_0000;
		#20	m1_address=8'h55; m1_dout=32'h5500_0000;
		#20	m1_address=8'h66; m1_dout=32'h6600_0000;
		#20
		#20	m1_req=1'b0; m0_req=1'b1; s0_dout=32'haaaa_aaaa; s1_dout=32'hbbbb_bbbb;
		#20	m1_wr=1'b0; m0_wr=1'b1;
		#20	m0_address=8'h11;	m1_address=8'h21; m0_dout=32'h1100_0000;
		#20	m0_address=8'h22; m1_dout=32'h2200_0000;
		#20   m0_address=8'h33; m1_dout=32'h3300_0000;
		#20	m0_address=8'h0f; m1_dout=32'h0f00_0000; m1_req=1'b1;
		#20	m0_address=8'haa; m1_dout=32'haa00_0000; m1_req=1'b1; m0_req=1'b0;
		#20	m0_address=8'h0d; m1_dout=32'h0d00_0000; 
		#20	m0_address=8'h30; m1_dout=32'h3000_0000;
		#20	m0_address=8'h55; m1_dout=32'h5500_0000;
		#20	m0_address=8'h15; m1_dout=32'h1500_0000;
		#20
		#20	m1_req=1'b1; m0_req=1'b1; s0_dout=32'hcccc_0000; s1_dout=32'hdddd_0000;
		#20	m1_wr=1'b0; m0_wr=1'b1;
		#20	m0_address=8'h11;	m1_address=8'h21; m0_dout=32'haaaa_0000; m1_dout=32'hbbbb_0000;
		#20	m1_wr=1'b1; m0_wr=1'b1;
		#20	m0_address=8'h22;  m0_dout=32'hacac_0000; m1_dout=32'h0000_bdbd;
		#20	m0_address=8'h30;  m0_dout=32'hffff_0000; m1_dout=32'h0000_9999;
		#20	m0_address=8'h55;  m0_dout=32'h8888_0000; m1_dout=32'h0000_7777;
		#20	m0_address=8'h15;  m0_dout=32'haaaa_0000; m1_dout=32'h0000_bbbb;
		#20	reset_n=1'b0;
		#30
		
	$stop;
	end
	
endmodule 