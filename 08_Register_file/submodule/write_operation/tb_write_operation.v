`timescale 1ns/1ns
module tb_write_operation();

	reg we;
	reg [2:0] Addr;
	wire [7:0] to_reg;

	write_operation U_wrop(
	.we(we),
	.Addr(Addr),
	.to_reg(to_reg)
	);
	
initial begin
		we=0; Addr=3'b001;
		#10 Addr=3'b010;
		#10 we=1; Addr=3'b011;
		#10 Addr=3'b110;
		#10 Addr=3'b111;
		
		
	$finish;
	
	end
	
endmodule 