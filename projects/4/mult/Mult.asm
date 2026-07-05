// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.


// initialise memory

@sum
M=0
@count
M=0
@R2
M=0

(LOOP)

// increment count by 1
@count
M=M+1

// when count greater than R0, goto end
@count
D=M
@R0
A=M
D=D-A
@PUT_RESULT
D;JGT

// increment total by R1
@R1
D=M
@sum
M=D+M

@LOOP
0;JMP

(PUT_RESULT)

// put sum in R2
@sum
D=M
@R2
M=D

(END)

@END
0;JMP
