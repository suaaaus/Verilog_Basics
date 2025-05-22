`timescale 1ns/1ns
module tb_add();
reg [63:0] multiplicand;
reg [1:0] X_count;
wire [127:0] add;
	
	
	add U_add(.multiplicand(multiplicand),
				.X_count(X_count),
				.add(add)
				);
				
				

		initial
		begin
					multiplicand=64'h0a1d_ffff_357a_d558; X_count=2'b00;
					
			#10	X_count=2'b11; 
			#10	X_count=2'b01; 
			#10	X_count=2'b10; 
			#10	X_count=2'b11;
			#10	X_count=2'b01;
			#10	X_count=2'b00;
			#10	X_count=2'b10;
			#10	X_count=2'b11;
			#10	X_count=2'b10;
			#10	X_count=2'b00;
			#10	X_count=2'b10;
			#10	X_count=2'b10;
			#10	X_count=2'b11; 
			#10	X_count=2'b11; 
			#10	X_count=2'b01; 
			#10	X_count=2'b01;
			#10	X_count=2'b10;
			#10	X_count=2'b11; 
			#10
	
	$stop;
		end
endmodule 