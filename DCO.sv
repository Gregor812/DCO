module DCO // black-box model
(
    input wire reset_i,
    input wire [7:0] freqCode_i,
    output wire signal_o
);

    reg internalClock;
    reg [31:0] counter;
    reg signal;
    
    assign signal_o = signal;
    
    localparam centralValue = 8'h7F;
    localparam ticksTo2048MHz = 32'd122070;
    
    initial
    begin
        internalClock = 0;
    end
    
    always
    begin
        #1fs;
        internalClock <= ~internalClock;
    end
    
    always @(posedge internalClock or negedge reset_i)
    begin
        if(!reset_i)
        begin
            counter <= '0;
            signal <= '0;
        end
        else if (counter == ticksTo2048MHz + (centralValue - freqCode_i))
        begin
            counter <= '0;
            signal <= ~signal;
        end
        else
            counter <= counter + 32'd1;
    end

endmodule
