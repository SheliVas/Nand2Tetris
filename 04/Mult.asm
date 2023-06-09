// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.



@R2   //declare var for result
M=0 // reset R2

// if R1>0 start the loop
@R1
D=M
@LOOP
D;JGT

// handle the base case of R1=0
@END
0;JMP

// implement multiplication by addision, we use R1 as the addition counter.
(LOOP)
  @R2          //load R2 to the register
  D=M

  @R0         //load R0
  D=D+M      //add R0 to R2 and store in the register

  @R2       //load R2 and enter the result into it.
  M=D

  @R1       // load mulipication counter
  D=M-1    // decrease by one - we added R0 once
  M=D

  @LOOP     // if R1>0, repeat loop
  D;JGT

(END)
  @END
  0;JMP


