module SingleNotePlayer(clk, note, freq_out, speaker);
    input clk;
    input [2:0] note;
	 output [18:0] freq_out = clkdivider[31:13];
    output speaker;
    reg [31:0] clkdivider = 50000000/2; // Base divider

    // Note Table (Hz)
    always@(posedge clk)
    begin
    case (note[2:0])
        3'b001: clkdivider <= 50000000/880; 	// A
        3'b010: clkdivider <= 50000000/986;     // B
        3'b011: clkdivider <= 50000000/1046;    // C
        3'b100: clkdivider <= 50000000/1147;    // D
        3'b101: clkdivider <= 50000000/1318;    // E
        3'b110: clkdivider <= 50000000/1396;    // F
        3'b111: clkdivider <= 50000000/1566;    // G
    endcase
    end

    reg [31:0] counter;
    always @(posedge clk) if(counter==0) counter <= clkdivider-1; else counter <= counter-1;

    reg speaker;
    always @(posedge clk) if((counter==0) && note) speaker <= ~speaker;
endmodule
