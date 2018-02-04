module DCO_tb;

    reg reset_i;
    reg [7:0] freqCode_i;
    wire signal_o;
    
    DCO dcoInstance
    (
        .reset_i(reset_i),
        .freqCode_i(freqCode_i),
        .signal_o(signal_o)
    );
    
    initial
    begin
        reset_i = 0;
        freqCode_i = 0;
        #1ps;
        reset_i = 1;
        freqCode_i = 8'hFF;
        #2s;
        $stop;
    end

endmodule
