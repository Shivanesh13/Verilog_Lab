module encoder (
    input [7:0]In,output [2:0]Out
);
    assign Out[0] = In[1] + In[3] + In[5] + In[7];
    assign Out[1] = In[2] + In[3] + In[6] + In[7];
    assign Out[2] = In[4] + In[5] + In[6] + In[7];
endmodule