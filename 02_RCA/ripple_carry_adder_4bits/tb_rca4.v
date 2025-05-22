`timescale 1ns/100ps


module tb_rca4;
   reg[3:0] tb_a, tb_b;
   reg tb_ci;
   wire[3:0] tb_s;
   wire tb_co;
   
   
   rca4 rca1(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
   
initial

begin

				  tb_a=4'b0000; tb_b=4'b0000; tb_ci=0000;
   #10;       tb_a=4'b0001; tb_b=4'b0001;   
   #10;       tb_a=4'b0010; tb_b=4'b0010;
   #10;       tb_a=4'b0111; tb_b=4'b0111; 	// 7+7=14
   #10;       tb_a=4'b1000; tb_b=4'b1000;		// 8+8=16  
	#10; 		  tb_ci=1;
	#10;       tb_a=4'b1111; tb_b=4'b1111; tb_ci=0000;
	#10; 		  tb_ci=1;
   #10;       $stop;
   
end

endmodule

