`timescale 1ns/1ns
module tb_read_operation();
	reg [31:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, from_reg7;
	reg [2:0] Addr;
	wire [31:0] Data;

read_operation U_rop(
.from_reg0(from_reg0), .from_reg1(from_reg1), .from_reg2(from_reg2), .from_reg3(from_reg3), .from_reg4(from_reg4), .from_reg5(from_reg5), .from_reg6(from_reg6), .from_reg7(from_reg7),
.Addr(Addr),
.Data(Data)
	);
	

	
	
initial begin
		from_reg0=32'h0000_0000; from_reg1=32'h0000_1111;
		from_reg2=32'h0000_2222; from_reg3=32'h0000_3333; 
		from_reg4=32'h0000_4444; from_reg5=32'h0000_5555; 
		from_reg6=32'h0000_6666; from_reg7=32'h0000_7777;
		

		#10		 Addr=3'b000;
		#10		 Addr=3'b001;
		#10		 Addr=3'b010;
		#10		 Addr=3'b011;
		#10		 Addr=3'b100;
		#10		 Addr=3'b101;
		#10		 Addr=3'b110;
		#10		 Addr=3'b111;
		
	$finish;
	
	end
	
endmodule 