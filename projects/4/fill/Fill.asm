// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.


@SCREEN
D=A
@screen_address_current
M=D
@screen_address_base
M=D
@24576
D=A
@screen_address_final
M=D


(LOOP)
@24576
D=M
@WRITE_BLACK_SCREEN
D;JGT
@WRITE_WHITE_SCREEN
0;JMP
@LOOP
0;JMP

(WRITE_WHITE_SCREEN)
// set current address to base address
@screen_address_base
D=M
@screen_address_current
M=D

(WRITE_WHITE_SCREEN_LOOP)
// set current address to all white
@screen_address_current
A=M
M=0

// increment current address
@screen_address_current
M=M+1
D=A

// if at end go back to loop
@screen_address_final
D=M
@screen_address_current
A=M
D=D-A
@WRITE_WHITE_SCREEN_LOOP
D;JGT
@LOOP
0;JMP


(WRITE_BLACK_SCREEN)
// set current address to base address
@screen_address_base
D=M
@screen_address_current
M=D

(WRITE_BLACK_SCREEN_LOOP)
// set current address to all black
@screen_address_current
A=M
M=-1

// increment current address
@screen_address_current
M=M+1
D=A

// if at end go back to loop
@screen_address_final
D=M
@screen_address_current
A=M
D=D-A
@WRITE_BLACK_SCREEN_LOOP
D;JGT
@LOOP
0;JMP

