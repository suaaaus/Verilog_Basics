module _8bitcounter_up(count, load, init, clk, en, cnt);
	input count, load, clk, en; //with initial
	input [7:0] init;
	output [7:0] cnt;
	
	
	assign cntload = count & ~load;
	
	assign inand0 = load & init[0];
	assign innand0 = load & ~init[0];
	
	assign inand1 = load & init[1];
	assign innand1 = load & ~init[1];
	
	assign inand2 = load & init[2];
	assign innand2 = load & ~init[2];
	
	assign inand3 = load & init[3];
	assign innand3 = load & ~init[3];
	
	assign inand4 = load & init[4];
	assign innand4 = load & ~init[4];
	
	assign inand5 = load & init[5];
	assign innand5 = load & ~init[5];
	
	assign inand6 = load & init[6];
	assign innand6 = load & ~init[6];
	
	assign inand7 = load & init[7];
	assign innand7 = load & ~init[7];

	assign j0 = inand0 | cntload;
	assign k0 = innand0 | cntload;
	
 jk_ff U0_jk(.j(j0), .k(k0), .clk(clk), .en(en), .q(cnt[0]));

 assign w1 = cntload&cnt[0];
 assign j1 = w1|inand1;
 assign k1 = w1|innand1;
 
 jk_ff U1_jk(.j(j1), .k(k1), .clk(clk), .en(en), .q(cnt[1]));
 
 assign w2 = cntload&cnt[0]&cnt[1];
 assign j2 = w2|inand2;
 assign k2 = w2|innand2;
 
 jk_ff U2_jk(.j(j2), .k(k2), .clk(clk), .en(en), .q(cnt[2]));
 
 
 assign w3 = cntload&cnt[0]&cnt[1]&cnt[2];
 assign j3 = w3|inand3;
 assign k3 = w3|innand3;
 
 jk_ff U3_jk(.j(j3), .k(k3), .clk(clk), .en(en), .q(cnt[3]));
 
 
 assign w4 = cntload&cnt[0]&cnt[1]&cnt[2]&cnt[3];
 assign j4 = w4|inand4;
 assign k4 = w4|innand4;
 
 jk_ff U4_jk(.j(j4), .k(k4), .clk(clk), .en(en), .q(cnt[4]));
 
 
 assign w5 = cntload&cnt[0]&cnt[1]&cnt[2]&cnt[3]&cnt[4];
 assign j5 = w5|inand5;
 assign k5 = w5|innand5;
 
 jk_ff U5_jk(.j(j5), .k(k5), .clk(clk), .en(en), .q(cnt[5]));
 
 
 assign w6 = cntload&cnt[0]&cnt[1]&cnt[2]&cnt[3]&cnt[4]&cnt[5];
 assign j6 = w6|inand6;
 assign k6 = w6|innand6;
 
 jk_ff U6_jk(.j(j6), .k(k6), .clk(clk), .en(en), .q(cnt[6]));
 
 assign w7 = cntload&cnt[0]&cnt[1]&cnt[2]&cnt[3]&cnt[4]&cnt[5]&cnt[6];
 assign j7 = w7|inand7;
 assign k7 = w7|innand7;
 
 jk_ff U7_jk(.j(j7), .k(k7), .clk(clk), .en(en), .q(cnt[7]));
 
 endmodule 
 
 
 
 