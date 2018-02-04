module DCO // black-box model
(
    input wire reset_i,
    input wire [7:0] freqCode_i,
    output wire signal_o;
);

    reg internalClock;
    reg [31:0] counter;
    reg signal;
    
    assign signal_o = signal;
    
    initial
    begin
        internalClock = 0;
        counter = 0;
        signal = 0;
    end
    
    always
    begin
        #0.00048828125ps;
        internalClock <= ~internalClock;
    end
    
    always @(posedge internalClock or negedge reset_i)
    begin
        if(!reset_i)
        begin
            counter <= '0;
            signal <= '0;
        end
        else if (counter == 32'd999999)
        begin
            counter <= '0;
            signal <= ~signal;
        end
        else
            counter <= counter + 32'd1;
    end

endmodule
