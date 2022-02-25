module priority_encoder (
     In,idle,Out
);
    input [7:0]In;
    output [2:0]Out;
    output idle;
    wire [7:0]priority_out;
    priority P(In,idle,priority_out);
    encoder E(priority_out,Out);
    
endmodule