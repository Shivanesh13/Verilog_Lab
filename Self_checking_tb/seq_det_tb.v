/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage:  www.maven-silicon.com

Filename:	   seq_det_tb.v   

Description:       Sequence detector Testbench


Author Name:       Susmita

Version: 1.0
*********************************************************************************************/

module seq_det_tb();
       
       parameter cycle=10,
			           tsetup = 2,
								 thold = 2;

       reg  din,din_d1,din_d2,
            clock,
            reset;
      
       wire dout;
       integer count= 0;
  seq_det SQD(.seq_in(din),
              .clock(clock),
              .reset_in(reset),
              .detect_out(dout));
  
							always
							 begin
							   #(cycle/2) clock = 0;
								 #(cycle/2) clock = 1;
							 end 
  

       task initialize;
         begin
           din=1'b0;
         end
      endtask







 //Self-checking Testbench
 
 task RESET;
    begin
      reset = 1'b1;
      @(posedge clock);
      #(thold);
      if (dout !== 1'b0)
         begin
           $display("Reset is not working");
           $display("Error at time %t",$time);
           $stop;
         end
      $display("Reset is perfect");           
      reset = 1'bx;
      #(cycle - thold - tsetup);
    end
  endtask
  
	
	 task stimulus(input d);
		   begin
			  din = d;
				@(posedge clock);
				#(thold);         
        din = 1'bx;
        #(cycle - thold - tsetup);
			 end
		endtask
     
		 //2 stage pipelining
		 always@(posedge clock)
		  begin
			  din_d1 <= din;
				din_d2 <= din_d1;
			end
 
     always@(din)
		  begin 
			  if((din == 1)&& (din_d1 == 0) && (din_d2 == 1))
           begin 
             @(posedge clock)
             #(thold);
              if(dout !== 1)
                begin		
                   $display("Sequence not detected \n");
                end
              		 $display("Sequence detected \n");				
           end
     end					 
  initial
    begin
      initialize;
      RESET;
      stimulus(0);
      stimulus(1);
      stimulus(0);
      stimulus(1);
      stimulus(0);
      stimulus(1);
      stimulus(1);
      RESET;
      stimulus(1);
      stimulus(0);
      stimulus(1);
      stimulus(0);
			stimulus(1);
      //delay(10);    
      $finish;
    end
endmodule     
