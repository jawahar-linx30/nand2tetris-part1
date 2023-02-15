// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Initialize index i to the address of the last pixel on the screen
@8191
D=A
@i
M=D

(LOOP)
// Decrement index i and check if it's negative
@i
M=M-1
D=M
@INIT
D;JLT

// Load the keyboard value and check if it's nonzero
@KBD
D=M
@SKIP_WHITE
D;JEQ

// If a key was pressed, paint the current 16 pixels white
@SCREEN
D=A
@i
A=D+M
M=0
@LOOP
0;JMP

// If no key was pressed, skip to painting the current 16 pixels black
(SKIP_WHITE)
@BLACK
0;JMP

// Paint the current 16 pixels black and continue to the next iteration
(BLACK)
@SCREEN
D=A
@i
A=D+M
M=-1
@LOOP
0;JMP

// Initialize the index i to the last pixel address and return to the loop
(INIT)
@8191
D=A
@i
M=D
@LOOP
0;JMP