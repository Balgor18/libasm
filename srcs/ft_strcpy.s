;	char *	stpcpy(char * dst, const char * src);
;	- dst is store inside the register [RDI]
;	- src is store inside the register [RSI]

global _ft_strcpy
extern _ft_strlen

_ft_strcpy:
	mov		rax, rdi
	jmp		loop

loop:
	cmp		byte [rsi], 0
	jz		leave
	movsb
	jmp		loop

leave:
	mov		byte [rdi], 0	; Put '\0' at the end of the string
	ret