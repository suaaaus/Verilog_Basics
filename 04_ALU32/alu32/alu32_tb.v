`timescale 1ns/100ps

module alu32_tb;

  reg [31:0] tb_a, tb_b;
  reg [2:0] tb_op;
  wire [31:0] tb_result;
  wire tb_c, tb_n, tb_z, tb_v;

  
  alu32 U_alu32 (.a(tb_a),.b(tb_b),.op(tb_op),.result(tb_result),.c(tb_c),.n(tb_n),.z(tb_z),.v(tb_v));

 
	initial begin
	tb_a = 32'h0000_0000; tb_b = 32'hffff_ffff; tb_op = 3'b000; #10;
	tb_a = 32'hffff_ffff; #10;
	
	tb_b = 32'hffff_ffff; tb_op = 3'b001; #10;
	tb_b = 32'hf0f0_0f0f;
	tb_a = 32'h0000_0000; tb_b = 32'h03bb_03bb; tb_op = 3'b010; #10;
	
	tb_a = 32'h1111_1111; tb_b = 32'haaaa_aaaa; tb_op = 3'b011; #10;
	
	tb_a = 32'hffff_1001; tb_b = 32'haaaa_aaaa; tb_op = 3'b100; #10;
	
	tb_op = 3'b101; #10;
	
	tb_a = 32'h0013_1111; tb_b = 32'haaaa_aaaa; tb_op = 3'b110; #10;
	tb_a = 32'hffff_aaaa; tb_b = 32'hffff_cccc; #10;
	tb_a = 32'hffff_ffff; tb_b = 32'hffff_ffff; #10;
	tb_a = 32'h0000_0000; tb_b = 32'h0000_0000; #10; //z=1
	tb_a = 32'h7fff_ffff; tb_b = 32'h7fff_ffff; #10; //v=1 
	
	tb_a = 32'hffff_ffff; tb_b = 32'h0111_1111; tb_op = 3'b111; #10;
	tb_a = 32'haaaa_aaaa; tb_b = 32'hffff_ffff; #10;
	tb_a = 32'hbbbb_bbbb; tb_b = 32'hbbbb_bbbb; #10;
	$stop;
	end

endmodule

