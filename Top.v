module Top(CLOCK_50, SW, KEY, LEDG, LEDR, GPIO);
    input CLOCK_50;
    input [2:0] SW;
    input [3:0] KEY;
    output [2:0] LEDG;
    output [18:0] LEDR;
    output [7:0] GPIO;  // Speaker is connected to this

    // Instantiate the note player module
    SingleNotePlayerLayered player(
        .clk(CLOCK_50),
        .state(SW),
        .note(~KEY),
        .layer_out(LEDG),
		.freq_out(LEDR),
        .speaker(GPIO)
    );

endmodule
