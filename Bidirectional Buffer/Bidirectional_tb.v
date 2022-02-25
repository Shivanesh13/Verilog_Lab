module Bidirectional_tb();
    integer en_int,A_int,B_int;
    reg en;
    reg In_A,In_B; // These regesters will drive the A and B
    wire A,B;
    Bidirectional Bi(A,B,en);
    
    assign A = en?In_A:1'bz;
    assign B = ~en?In_B:1'bz;

    initial begin
        for (en_int =0 ;en_int<2 ;en_int=en_int+1 ) begin
            en = en_int;
            for (A_int =0 ;A_int<2 ;A_int = A_int+1 ) begin
                In_A = A_int;
                for (B_int = 0;B_int<2 ;B_int = B_int+1 ) begin
                    In_B = B_int;
                    #5;
                end
            end
        end
    end
    
    initial begin
        $dumpfile("Bidirectional_tb.vcd");
        $dumpvars(0,Bidirectional_tb);

        $monitor($time,"A = %b, Enable = %b, B = %b", A,en,B);
        #200 $finish;   
    end
endmodule