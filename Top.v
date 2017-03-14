module Top(CLOCK_50, SW, GPIO);
    input CLOCK_50;
    input [2:0] SW;
    output [35:0] GPIO;  // Speaker is connected to this

    // Instantiate the note player module
    SingleNotePlayer player(
        .clk(CLOCK_50),
        .note(SW[2:0]),
        .speaker(GPIO[7:0])
    );
endmodule
