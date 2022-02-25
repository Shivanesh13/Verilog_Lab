module encoder_tb_1 ();
    reg [7:0]In;
    wire [2:0]Out;
    wire idle;
    priority_encoder En(In,idle,Out);
    integer i;

    initial begin
        In = 8'b0;
        #100 $finish;
    end

    initial begin
        for (i = 0;i<40 ;i = i+1 ) begin
            In = {$random}%64;
            #10;
        end
    end

    initial begin
        $monitor("In = %b, Out = %b, idle = %b",In,Out,idle);
    end
endmodule