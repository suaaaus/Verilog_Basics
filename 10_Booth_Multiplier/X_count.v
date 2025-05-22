module X_count(count, count1, multiplier, _xcount);
   input [6:0] count;
   input [7:0] count1;
   input [63:0] multiplier;
   output [1:0] _xcount;

 
   
   wire [128:0] multiplier_0;
   assign multiplier_0 = {multiplier, 1'b0};

   assign _xcount[0] = multiplier_0[count];
	assign _xcount[1] = multiplier_0[count1];

   
   endmodule 