
module seq_det(seq_in,
               clock,
               reset_in,
               detect_out);
							 
//Declare the sates as parameter "IDLE","STATE1","STATE2","STATE3"
      parameter IDLE=2'b00,
		STATE1=2'b01,
		STATE2=2'b10,
		STATE3=2'b11;
   

//Write down the port direction

       input seq_in,clock,reset_in;
       output detect_out;

     reg [1:0]state,next_state;
      

       

//Write down the sequential logic for present state
     always@(posedge clock)
		   begin
			  if(reset_in)
			     state <= IDLE;
			  else
			     state <= next_state;
		   end


   
//Understand the combinational logic for next state
  always@(*)
  begin
    case (state)
         IDLE : if (seq_in==1) 
                    next_state=STATE1;
                else
                    next_state=IDLE;
         STATE1 : if (seq_in==0)
                     next_state=STATE2;
                  else 
                     next_state=state;
                  
         STATE2 : if (seq_in==1)
                      next_state=STATE3;
                  else if(seq_in == 0)
                      next_state=IDLE;
                  else
                      next_state = state;
         STATE3 : if (seq_in==1)
                      next_state=STATE1;
                  else if(seq_in == 0)
                      next_state=STATE2;
                  else
                      next_state = state;
         default : next_state=IDLE;
    endcase
  end
  

//Write down the logic for output dout
 assign detect_out = (state == STATE3);
 


endmodule
  

