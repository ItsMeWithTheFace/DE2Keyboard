module Main(clk, state, note, freq_out, layer, speaker);
    input clk;
    input [2:0] state;
    input [3:0] note;
    output [18:0] freq_out;
    output [2:0] layer;
    output [7:0] speaker;  // Speaker is connected to this

    wire [2:0] out_state;
    wire [2:0] layer_out = layer;

    // Instantiate finite state machine
    FSM fsm(
        .clk(clk),
        .state(state),
        .out_state(outstate),
        .layer_out(layer_out)
    );

    // Instantiate the note player module
    SingleNotePlayerLayered player(
        .clk(clk),
        .state(out_state),
        .note(~note),
        .layer_out(layer_out),
	    .freq_out(freq_out),
        .speaker(speaker)
    );

endmodule
