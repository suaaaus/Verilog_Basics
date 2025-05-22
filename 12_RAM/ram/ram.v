module ram(clk, cen, wen, addr, din, dout);
	input clk;
	input cen, wen;
	input [4:0] addr; //Bandwidth of Address
	input [31:0] din; //Bandwidth of Data
	output reg [31:0] dout;
	
	reg [31:0] mem [0:31]; // decare memmory
	integer i;
	
	
 initial begin
    // Memory initialization using for loop
    for (i = 0; i < 32; i = i + 1) 
      mem[i] = 32'h1 << i; 
    
  end
	
	
	always @(posedge clk)
	begin
		if ((cen==1'b1) && (wen==1'b1)) begin
		mem[addr] <= din;
		dout <= 32'h0000_0000;
		end
		
		else if ((cen==1'b1) && (wen==1'b0)) begin
		dout <= mem[addr];
		end
		
		else if (cen==1'b0) begin
		dout <= 32'h0000_0000;
		end
	end  // read/write performance

endmodule
