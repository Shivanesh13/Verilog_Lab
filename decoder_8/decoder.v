module decoder (
    In,enable,Out,IDLE
);
    input [2:0]In;
    input enable;
    output [7:0]Out;
    output reg IDLE;
    reg [7:0]shift,Num;

    task shift_op;
    input [2:0]In;
    output IDLE;
    begin
        shift = Num << In;
        IDLE = 1'b0;
    end
    endtask

    task initialize;
    begin
        Num = 8'b1;
    end
    endtask

    always @(*) begin
        initialize;
        shift_op(In,IDLE);
        if(In == 8'b0 && enable == 1'b1) 
            begin 
                IDLE = 1'b1;
                shift = 8'bz;
            end
    end
	 assign Out = (enable)?shift:8'bz;
	 
endmodule