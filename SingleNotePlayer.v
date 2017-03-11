module SingleNotePlayer(clk, note, speaker);
    input clk;
    input [3:0] note;
    output speaker;
    reg clkdivider = 50000000/2;

    // Note Table (Hz)
    always@(note)
    begin
    case (note[3:0])
        4'd0: clkdivider <= clkdivider/880; // A
        4'd1: clkdivider <= clkdivider/988; // B
        4'd2: clkdivider <= clkdivider/523; // C
        4'd3: clkdivider <= clkdivider/587; // D
        default: clkdivider <= 50000000/2;  // Reset clkdivider
    endcase
    end

    reg [14:0] counter;
    always @(posedge clk) if(counter==0) counter <= clkdivider-1; else counter <= counter-1;

    reg speaker;
    always @(posedge clk) if((counter==0) && ~note) speaker <= ~speaker;
endmodule
