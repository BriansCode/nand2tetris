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

(START)
    @SCREEN
    D=A
    @i
    M=D  // reset index to screen address
    
    @color
    M=0
    @KBD
    D=M
    @FILL
    D;JEQ  // keep color as white if no key pressed
    @color
    M=-1  // set color to black since key is pressed

(FILL)
    @i
    D=M 
    @KBD
    D=D-A
    @START
    D;JEQ  // if past the last index then FILL loop is done, goto START

    @color
    D=M
    @i
    A=M
    M=D  // set the pixels to the specified color
    @i
    M=M+1

    @FILL
    0;JMP  // continue looping
