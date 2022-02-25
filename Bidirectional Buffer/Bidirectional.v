module Bidirectional (
    A,B,en
);
    inout A,B;
    input en;
    assign A = (en)?1'bz:B;
    assign B = (en)?A:1'bz;
endmodule