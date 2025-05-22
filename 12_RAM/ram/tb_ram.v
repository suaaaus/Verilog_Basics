`timescale 1ns/1ns
module tb_ram();
	reg clk;
	reg cen, wen;
	reg [4:0] addr; //Bandwidth of Address
	reg [31:0] din; //Bandwidth of Data
	wire [31:0] dout;
	
	
	
	ram U_ram(.clk(clk), .cen(cen), .wen(wen), .addr(addr), .din(din), .dout(dout));
	
	
	always #10 clk=~clk;
	
	initial begin
		clk=1'b0; cen=1'b0; wen=1'b0; addr=5'b00000; din=32'h0000_0000;
		#15  addr=5'b00011; cen=1'b1;  wen=1'b1; din=32'hcccc_faf4;
		#20  addr=5'b11000; cen=1'b1;  wen=1'b1; din=32'hffff_faf4;
		#20  addr=5'b01010; cen=1'b1;  wen=1'b1; din=32'haaaa_faf4;
		#20  addr=5'b10101; cen=1'b1;  wen=1'b1; din=32'hdddd_faf4;
		#20  addr=5'b11111; cen=1'b1;  wen=1'b1; din=32'hbbbb_faf4;
		
		#20  addr=5'b00011; cen=1'b1;  wen=1'b0; 
		#20  addr=5'b11000; cen=1'b1;  wen=1'b0; 
		#20  addr=5'b01010; cen=1'b1;  wen=1'b0;
		#20  addr=5'b10101; cen=1'b1;  wen=1'b0; 
		#20  addr=5'b11111; cen=1'b1;  wen=1'b0;
				
		#20  addr=5'b01010; cen=1'b0; 
		#20  addr=5'b10101; cen=1'b0;  
		#20  addr=5'b00000; cen=1'b0; 
		#20  addr=5'b11111; cen=1'b0; 
		#20  addr=5'b11001; cen=1'b0; 
	   #20	
	

	$stop;
	end
	
endmodule 