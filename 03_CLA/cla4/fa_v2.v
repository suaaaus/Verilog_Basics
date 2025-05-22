module fa_v2 (a, b, ci, s);
input a, b, ci;
output s;
wire w0;

_xor2 xor1(.a(a), .b(b), .y(w0));
_xor2 xor2(.a(w0), .b(ci), .y(s));

endmodule
