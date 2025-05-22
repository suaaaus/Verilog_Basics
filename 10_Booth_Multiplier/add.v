module add(multiplicand, _xcount, add);
input [63:0] multiplicand;
input [1:0] _xcount;
output reg [127:0] add;

wire [63:0] multiplicand_bar;

	_2s_complement U0_2scomplement(.a(multiplicand), .y(multiplicand_bar));



always @(*) begin
case(_xcount)
 2'b00 : add=128'h0;
 2'b01 : add={multiplicand, {64{1'b0}}};
 2'b10 : add={multiplicand_bar, {64{1'b0}}};
 2'b11 : add=128'h0;
 default : add=128'h0;
 endcase
 end
 
 endmodule 