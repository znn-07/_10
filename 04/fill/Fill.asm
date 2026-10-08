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

(LOOP)
    // 檢查鍵盤狀態
    @KBD
    D=M

    // 若 D != 0 代表有按鍵，跳轉到 SET_BLACK 設定填滿顏色為黑色 (-1)
    @SET_BLACK
    D;JNE

    // 否則無按鍵，設定填滿顏色為白色 (0)
    D=0
    @SET_COLOR
    0;JMP

(SET_BLACK)
    D=-1

(SET_COLOR)
    // 將選擇好的顏色 (0 或 -1) 存入變數 color
    @color
    M=D

    // 初始化螢幕指標 addr = SCREEN (16384)
    @SCREEN
    D=A
    @addr
    M=D

(DRAW_LOOP)
    // 檢查是否已塗滿整個螢幕 (addr == KBD, 即 24576)
    @addr
    D=M
    @KBD
    D=D-A
    @LOOP
    D;JEQ    // 若 addr == KBD 代表繪製完成，跳回主迴圈重新偵測鍵盤

    // 將顏色寫入當前螢幕記憶體位址
    @color
    D=M
    @addr
    A=M
    M=D

    // 指標移動到下一個記憶體位址 addr = addr + 1
    @addr
    M=M+1

    // 繼續塗下一個 word
    @DRAW_LOOP
    0;JMP