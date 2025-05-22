`timescale 1ns/1ns
module tb_bus_arbit();
	reg clk, reset_n;
	reg m0_req, m1_req;
	wire m0_grant, m1_grant;
	wire next_state;
	
	bus_arbit U_bus_arbit(.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant), .next_state(next_state));
	
	
	always #10 clk=~clk;
	initial
	begin
		   	clk=1'b0; reset_n=1'b0; m0_req=1'b0; m1_req=1'b1;
		#15   reset_n=1'b1; 
		#30	m0_req=1'b0; m1_req=1'b1;
		#30	m0_req=1'b1; m1_req=1'b1;
		#30	m0_req=1'b1; m1_req=1'b0;
		#30	m0_req=1'b0; m1_req=1'b0;
		#15   reset_n=1'b0; 
		#30	m0_req=1'b1; m1_req=1'b1;
		#5		reset_n=1'b1; 
		#30	m0_req=1'b1; m1_req=1'b0;
		#30	m0_req=1'b0; m1_req=1'b0;
		#30	m0_req=1'b0; m1_req=1'b1;
		#30	
	$stop;
	end
	
endmodule 