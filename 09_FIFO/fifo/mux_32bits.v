module mux_32bits(sel, data_in, data_out);
    input sel;
    input  [31:0] data_in;
    output reg [31:0] data_out;
    
    
    always@(*)begin
        case(sel)
            1'b0 : data_out = 32'h0;
            1'b1 : data_out = data_in;
            default : data_out = 32'h0;
        endcase
    end

endmodule