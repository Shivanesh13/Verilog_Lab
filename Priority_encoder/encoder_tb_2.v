module encoder_tb_2;
    reg [7:0]In;
    wire [2:0]Out;
    reg [7:0]mem[0:11];
    wire IDLE;
    priority_encoder En(In,IDLE,Out);
    integer i,chanel_1;

    initial begin
        In = 8'b0;
        #200 $finish;
    end

    initial begin
        $readmemb("File_1.txt",mem);
    end

    initial begin
        for (i = 0;i<12 ;i = i+1 ) begin
            In = mem[i];
            #10;
        end
    end
    initial begin
            $monitor("In = %b, Out = %b, IDLE = %b",In,Out,IDLE);
    end

    initial begin
        chanel_1 = $fopen("File_2.txt");
        $fmonitor(chanel_1,"In = %b, Out = %b, IDLE = %b",In,Out,IDLE);
        #200;
        $fclose(chanel_1);
    end
endmodule