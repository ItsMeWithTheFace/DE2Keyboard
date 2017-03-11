module Top(CLOCK_50, KEY, GPIO);
    input CLOCK_50;
    input [3:0] KEY;
    output [3:0] GPIO;  // Speaker is connected to this, need to change

    // Instantiate the note player module
    SingleNotePlayer player(
        .clk(CLOCK_50),
        .note(KEY[3:0]),
        .speaker(GPIO[3:0])
    );
endmodule