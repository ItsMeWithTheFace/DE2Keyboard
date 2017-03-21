module Top(CLOCK_50, KEY, LEDR, GPIO);
    input CLOCK_50;
    input [2:0] KEY;
    output [18:0] LEDR;
    output [7:0] GPIO;  // Speaker is connected to this

    // Instantiate the note player module
    SingleNotePlayer player(
        .clk(CLOCK_50),
        .note(~KEY[2:0]),
		.freq_out(LEDR[18:0]),
        .speaker(GPIO)
    );

endmodule
