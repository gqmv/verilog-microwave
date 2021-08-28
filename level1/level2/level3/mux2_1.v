module mux2_1 (
    input wire selector,
    input wire d0,
    input wire d1,
    output reg out
);
    
    always @(d0 or d1 or selector) begin
        if(selector)
            out = d1;
        else
            out = d0;
    end
    
endmodule