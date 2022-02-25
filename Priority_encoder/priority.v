module priority (
    In,IDLE,Out
);
    input [7:0]In;
    output [7:0]Out;
    output IDLE;

    assign Out[7] = In[7];
    assign Out[6] = In[6]&(~In[7]);
    assign Out[5] = In[5]&(~In[6])&(~In[7]);
    assign Out[4] = In[4]&(~In[5])&(~In[6])&(~In[7]);
    assign Out[3] = (In[3])&(~In[4])&(~In[5])&(~In[6])&(~In[7]);
    assign Out[2] = (In[2])&(~In[3])&(~In[4])&(~In[5])&(~In[6])&(~In[7]);
    assign Out[1] = (In[1])&(~In[2])&(~In[3])&(~In[4])&(~In[5])&(~In[6])&(~In[7]);
    assign Out[0] = (In[0])&(~In[1])&(~In[2])&(~In[3])&(~In[4])&(~In[5])&(~In[6])&(~In[7]);
    assign IDLE = (~In[0])&(~In[1])&(~In[2])&(~In[3])&(~In[4])&(~In[5])&(~In[6])&(~In[7]);
    

endmodule