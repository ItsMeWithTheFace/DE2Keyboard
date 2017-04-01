# DE2 Keyboard
A small layered keyboard capable of playing up to 12 notes.
Users can switch between layers to access different levels of notes.
This keyboard is intended to be run on an Altera DE2 FPGA board.

# Installing
Ensure you have Quartus running on your computer.
Create a new project and add the following files to it:
  * Top_Old.v
  * SingleNotePlayerLayered.v

To use a separated FSM associated with this project, add these files to the project instead:
  * Top.v
  * Main.v
  * FSM.v
  * SingleNotePlayerLayered.v

Note that the explicit FSM is currently unstable so it is recommended to follow the first option.

# Playing
The keyboard uses all four KEY buttons on the Altera DE2 FPGA board. Any key will play a single note.
Alternate between layers using SW [2:0]. There are 3 layers giving a total of 12 playable notes.
Ensure you have a speaker/buzzer connected to any of the GPIO[7:0] ports.
