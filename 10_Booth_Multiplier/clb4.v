module clb4(a,b,ci,c1,c2,c3,co);
	input [3:0]a,b;
	input ci;
	output c1,c2,c3,co;
	wire [3:0] g,p;



// instances about generate signal {Gi}
assign g[0] = a[0]&b[0];
assign g[1] = a[1]&b[1];
assign g[2] = a[2]&b[2];
assign g[3] = a[3]&b[3];



// instances about propagate signal {Pi}
assign p[0] = a[0]|b[0];
assign p[1] = a[1]|b[1];
assign p[2] = a[2]|b[2];
assign p[3] = a[3]|b[3];



// instances about c1 { c1 = g[0] | (p[0] & ci)}
assign c1 = g[0] | (p[0] & ci);

// instances about c2 { c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci) }
assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & ci);


// instances about c3 { c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci) }
assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & ci);


// instances about co
assign co=(p[3] & g[2])|(p[3] & p[2] & g[1])|(p[3] & p[2] & p[1] & g[0])|(p[3] & p[2] & p[1] & p[0] & ci);

endmodule 
