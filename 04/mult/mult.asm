// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// 初始化 R2 = 0
@2
M=0

// 將 R0 的值複製到變數 i (RAM[16])
@0
D=M
@i
M=D

(LOOP)
    // 檢查 i <= 0，若是則結束
    @i
    D=M
    @END
    D;JLE

    // R2 = R2 + R1
    @1
    D=M
    @2
    M=D+M

    // i = i - 1
    @i
    M=M-1

    // 繼續迴圈
    @LOOP
    0;JMP

(END)
    @END
    0;JMP