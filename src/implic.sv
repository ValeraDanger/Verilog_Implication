module implic (
    input  logic a,
    input  logic b,
    output logic c
);

    assign c = ~a | b;
    
endmodule

module ex_implic (
    input  logic a,
    input  logic b,
    output logic c
);

    assign c = a & ~b;
    
endmodule