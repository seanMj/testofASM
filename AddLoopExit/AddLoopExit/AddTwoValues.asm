.386
.model flat, stdcall
.stack 2096
ExitProcess PROTO, dwExitCode:DWORD
.data
	code DWORD 0
.code
main PROC
	mov eax, 40
	imul eax, eax, 20
	mov ecx, eax
	xor eax, eax
Loop_1:
	sub ecx, 1
	cmp ecx, 0
	jnz Loop_1
	xor ecx, ecx
Loop_2:
	add code, 1
	cmp code, 0ffffh
	mov eax, code
	jle Loop_2
	pop code
	pop ecx
	INVOKE ExitProcess, eax
main ENDP
END main