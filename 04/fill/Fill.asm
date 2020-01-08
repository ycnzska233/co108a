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
(FOREVER) 

//n = 8192
    @8192
    D=A //將位址8192存在D
    @n
    M=D //將8192存在n

//arr = screen
    @SCREEN
    D=A
    @arr
    M=D
//i = 0
    @i
    M=0 // 將i設為0

//j = 0
    @j
    M=0 // 將j設為0

            //while(i<n)
            //=>if(i==n) goto ELSE
//PrintLoop
                (PrintLoop)
                @i
                D=M 
                @n
                D=D-M 
                @ELSE
                D;JEQ 

            //if(*KBD != 0)
                @KBD
                D=M
                @ELSE
                D;JEQ 

            //arr[i] = -1//因為-1在二進位中為1111111111111111,才會顯示全黑
                @arr
                D=M
                @i
                A=D+M
                //@SCREEN
                M=-1 

            //i = i + 1
                @i
                M=M+1
                @IFEND 
                0;JMP

//ELSE
                (ELSE)
                @j
                D=M 
                @n
                D=D-M 
                @END
                D;JEQ 

                @arr
                D=M
                @j
                A=D+M
                M=0
                //j = j + 1
                @j
                M=M+1
                @ELSE
                0;JMP

//IFEND
                (IFEND)
                @PrintLoop
                0;JMP

//END
                (END)
                @FOREVER
                0;JMP