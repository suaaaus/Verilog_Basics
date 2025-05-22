`timescale 1ns/1ns
module tb_bus_addr();
	reg [7:0] s_address;
	wire s0_sel, s1_sel;
	
	bus_addr U_bus_addr(.s_address(s_address), .s0_sel(s0_sel), .s1_sel(s1_sel));
	
	
	initial
	begin
		   	s_address=8'h1f;
		#30   s_address=8'h05;
		#30	s_address=8'h1a;
		#30	s_address=8'h2f;
		#30	s_address=8'h30;
		#30	s_address=8'h39;
		#30   s_address=8'h15;
		#30	s_address=8'h11;
		#30	s_address=8'h07;
		#30	s_address=8'h55;
		#30	s_address=8'h1d;
		#30	
	$stop;
	end
	
endmodule 

