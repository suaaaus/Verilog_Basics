module bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant, next_state);
	input clk, reset_n;
	input m0_req, m1_req;
	output reg m0_grant, m1_grant;
	output reg next_state;
	

    parameter M0_Grant = 1'b0;
    parameter M1_Grant = 1'b1;
	 
	 
	
 always @(posedge clk or negedge reset_n) begin
    if (~reset_n)
      next_state <= M0_Grant;
    else
     case (next_state)
      M0_Grant: begin
                  if ((m0_req == 0) && (m1_req == 1))
                    next_state = M1_Grant;
                  else if ((m0_req == 0 && m1_req == 0)||(m0_req == 1))
                    next_state = M0_Grant;
                end

      M1_Grant: begin
                  if (m1_req == 1)
                    next_state = M1_Grant;
                  else if (m0_req == 1)
                    next_state = M0_Grant;
                end

      default: begin
                 next_state = 1'bx;
               end
    endcase
  end
  
  
  always @(next_state, m0_grant, m0_grant)
		case (next_state)
			1'b0 : begin m0_grant = 1'b1; m1_grant = 1'b0; end
			1'b1 : begin m0_grant = 1'b0; m1_grant = 1'b1; end
			default : begin m0_grant = 1'bx; m1_grant = 1'bx; end
		endcase
  

endmodule 