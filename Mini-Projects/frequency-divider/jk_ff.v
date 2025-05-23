module jk_ff(j, k, clk, en, q);
input j, k, clk, en;
output reg q;



always @(posedge clk)
begin
 if (en)
	case({j,k}) 
            2'b00:
                q <= q;
            2'b01:
                q <= 1'b0;
            2'b10:
                q <= 1'b1;
            2'b11:
                q <= ~q;
            default:
                q <= q;
   endcase
	
	else q <= 1'b0;
    end



endmodule 