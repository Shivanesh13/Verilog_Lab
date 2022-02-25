module decoder_tb (
);
    reg [2:0]In;
    reg enable;
    wire [7:0]Out;
    wire IDLE;
    decoder D(In,enable,Out,IDLE);
    initial begin
        In = 3'b0;
        enable = 0;
    end
    initial begin
        #5;
        enable = 1;
        repeat(10) begin
            In = {$random}%8;
            #5;
        end   
        In = 0;
        #5; 
        In = 3'b111;
        #5 In = 3'b110;
        #5
        enable = 0;
    end
    initial begin
        $monitor("In = %b, Out = %b, Enable = %b, IDLE = %b",In,Out,enable,IDLE);
        #200 $finish;
    end
endmodule