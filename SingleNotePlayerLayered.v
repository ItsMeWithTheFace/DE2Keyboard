module SingleNotePlayerLayered(clk, state, note, layer_out, freq_out, speaker);
    input clk;
    input [2:0] state;
    input [3:0] note;

	reg [31:0] clkdivider; // Frequency divider

	output reg [18:0] freq_out;
    output reg [2:0] layer_out;
    output speaker;


    // Layered Note Table (Hz)
    always@(posedge clk)
    begin
    case (state[2:0])
    3'b001: // Layer 1
        begin
            layer_out <= 3'b001;
            case (note[3:0])
                4'b0001: clkdivider <= 50000000/880; 	 // A
                4'b0010: clkdivider <= 50000000/932;     // A#
                4'b0100: clkdivider <= 50000000/986;     // B
                4'b1000: clkdivider <= 50000000/1046;    // C
            endcase
        end
    3'b010: // Layer 2
        begin
            layer_out <= 3'b010;
            case (note[3:0])
                4'b0001: clkdivider <= 50000000/1108;    // C#
                4'b0010: clkdivider <= 50000000/1147;    // D
                4'b0100: clkdivider <= 50000000/1244;    // D#
                4'b1000: clkdivider <= 50000000/1318;    // E
            endcase
        end
    3'b100: // Layer 3
        begin
            layer_out <= 3'b100;
            case (note[3:0])
                4'b0001: clkdivider <= 50000000/1396;    // F
                4'b0010: clkdivider <= 50000000/1478;    // F#
                4'b0100: clkdivider <= 50000000/1566;    // G
                4'b1000: clkdivider <= 50000000/1660;    // G#
            endcase
        end

    default: layer_out <= 3'b000;   // Not in any state

    endcase
    end

    reg [31:0] counter;
    always @(posedge clk)
    begin
        if(counter==0) counter <= clkdivider-1; else counter <= counter-1;
        freq_out <= clkdivider[18:0];
    end

    reg speaker;
    always @(posedge clk) if((counter==0) && note) speaker <= ~speaker;
endmodule
