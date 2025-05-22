module clb4(a,b,ci,c1,c2,c3,co);
	input [3:0]a,b;
	input ci;
	output c1,c2,c3,co;
	wire [3:0] g,p;
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3, w1_c3, w2_c3;
	wire w0_co, w1_co, w2_co, w3_co;


// instances about generate signal {Gi}
_and2 and0(.a(a[0]),.b(b[0]),.y(g[0]));
_and2 and1(.a(a[1]),.b(b[1]),.y(g[1]));
_and2 and2(.a(a[2]),.b(b[2]),.y(g[2]));
_and2 and3(.a(a[3]),.b(b[3]),.y(g[3]));


// instances about propagate signal {Pi}
_or2 or0(.a(a[0]),.b(b[0]),.y(p[0]));
_or2 or1(.a(a[1]),.b(b[1]),.y(p[1]));
_or2 or2(.a(a[2]),.b(b[2]),.y(p[2]));
_or2 or3(.a(a[3]),.b(b[3]),.y(p[3])); 


// instances about c1 { c1 = g[0] | (p[0] & ci)}
_and2 and4(.a(p[0]),.b(ci),.y(w0_c1)); // w0_c1 = (p[0] & ci)
_or2 or4(.a(g[0]),.b(w0_c1),.y(c1)); // c1=g[0] | w0_c1

// instances about c2 { c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci) }
_and2 and5(.a(p[1]),.b(g[0]),.y(w0_c2));	//(p[1] & g[0])
_and3 and6(.a(p[1]),.b(p[0]),.c(ci),.y(w1_c2));	//(p[1] & p[0] & ci)
_or3 or5(.a(g[1]),.b(w0_c2),.c(w1_c2),.y(c2));	


// instances about c3 { c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci) }
_and2 and7(.a(p[2]),.b(g[1]),.y(w0_c3));
_and3 and8(.a(p[2]),.b(p[1]),.c(g[0]),.y(w1_c3));
_and4 and9(.a(p[2]),.b(p[1]),.c(p[0]),.d(g[0]),.y(w2_c3));
_or4 or6(.a(g[2]),.b(w0_c3),.c(w1_c3),.d(w2_c3),.y(c3));


// instances about co
_and2 and10(.a(p[3]),.b(g[2]),.y(w0_co));	//(p[3] & g[2])
_and3 and11(.a(p[3]),.b(p[2]),.c(g[1]),.y(w1_co));	//(p[3] & p[2] & g[1])
_and4 and12(.a(p[3]),.b(p[2]),.c(p[1]),.d(g[0]),.y(w2_co));	//(p[3] & p[2] & p[1] & g[0])
_and5 and13(.a(p[3]),.b(p[2]),.c(p[1]),.d(g[0]),.e(ci),.y(w3_co));	//(p[3] & p[2] & p[1] & p[0] & ci)
_or5 or7(.a(g[3]),.b(w0_co),.c(w1_co),.d(w2_co),.e(w3_co),.y(co));

endmodule 
