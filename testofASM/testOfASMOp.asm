.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data 
	code BYTE	8fh
	
.code
main PROC
	;	code = 0x8f	<- 8 bit <- 1 byte
	;	ax is a 16bit value, by using sign ext. (movZX), 'code' which is housing
	;	a single byte, the op can move it's value into ax. this is pretty cool i think
	;	one of those things of ASM that i find quite wonderful and complex, which adds to its beauty
	movzx ax, code
	
	;	ax = 0x008f <- 16 bit <- 2 bytes
	;	give eax the exact value of ax
	;	here we are sign extending ax (a 16 bit value), into eax (a 32 bit value), as before
	;	we are not able to do this unless we sign extended
	movzx eax, ax
	
	;	eax = 0x0000ff8f <- 32 bit <- 4 bytes
	;	after sign ext. this will cause the value of ax
	;	to be sign extended, basically adding FF to the beginning of the value
	movzx ax, code	
	
	movzx ecx, ax
	;mov eax, 0
	test eax, ecx	;see, oh-ya	both [==(65423)	
	
	
	push eax
	call ExitProcess	;exit process is used within VS to display the values because im cheep with 'dem CPU cyc's

main ENDP
END main

;0x8f
	;0x008f
	;0x0000008f are all the same value
	----
	;0xff8f		after sign-extension of ax
COMMENT =
	;this is basically a code i wrote to test some stuff witin chapter four,
	;but I decided to go a few extra steps in my self-exploration
=