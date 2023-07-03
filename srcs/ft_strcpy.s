bits 64

;	char *	stpcpy(char * dst, const char * src);
;	- dst is store inside the register [RDI]
;	- src is store inside the register [RSI]

global ft_strcpy

ft_strcpy:
	mov		rax, rdi
	jmp		loop

loop:
	cmp		byte [rsi], 0
	jz		leave
	movsb
	jmp		loop

leave:
	mov		byte [rdi], 0
	ret