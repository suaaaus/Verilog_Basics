`timescale 1ns/1ns
module tb_fifo();
	reg clk, reset_n, rd_en, wr_en;
	reg [31:0] d_in;
	wire [31:0] d_out;
	wire full, empty, wr_ack, wr_err, rd_ack, rd_err;
	wire [3:0] data_count;

	
fifo U_fifo(
	.clk(clk), 
	.reset_n(reset_n), 
	.rd_en(rd_en),
	.wr_en(wr_en),
	.d_in(d_in),
	.d_out(d_out),
	.full(full),
	.empty(empty),
	.wr_ack(wr_ack), 
	.wr_err(wr_err), 
	.rd_ack(rd_ack),
	.rd_err(rd_err),
	.data_count(data_count)
	);
	

	always #20 clk=~clk;
	
	
initial begin

		clk=1'b0;	reset_n=1'b0; d_in=32'h0000_0000; rd_en=1'b0; wr_en=1'b0;
		#45		 reset_n=1'b1;
		#40		 rd_en=1'b1; 
		#40		 rd_en=1'b0; wr_en=1'b1;  d_in=32'h1111_0000;
		#40		d_in=32'h2222_0000;
		#40		d_in=32'h3333_0000;
		#40		d_in=32'h4444_0000;
		#40		d_in=32'h5555_0000;
		#40		d_in=32'h6666_0000;
		#40		d_in=32'h7777_0000;
		#40		d_in=32'h8888_0000;
		#40		d_in=32'h9999_0000;
		#40		d_in=32'haaaa_0000;
		#40		d_in=32'hbbbb_0000;		
//	   #40		d_in=32'hcccc_0000;
//		#40		d_in=32'hdddd_0000;
//		#40		d_in=32'heeee_0000;
//		#40		d_in=32'hffff_0000;
//		#40		d_in=32'hefef_efef;
		#30     wr_en=1'b0; rd_en=1'b0;
		#40		rd_en=1'b1;
		#100	  wr_en=1'b1; rd_en=1'b0;
		#40	  wr_en=1'b0; rd_en=1'b1;
		#500
	$stop;
	
	end
	
endmodule 