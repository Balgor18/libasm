bits 64

;	int		strcmp(const char *s1, const char *s2);
;	- s1 is store inside the register [RDI]
;	- s2 is store inside the register [RSI]


global ft_strcmp

ft_strcmp:
	cmp		byte [rdi], 0
	je		check_s2
	cmp		byte [rsi], 0
	je		check_s1

loop:
	movzx	eax, byte [rdi]
	movzx	edx, byte [rsi]
	cmp		eax, edx
	jne		diff

	inc		rdi
	inc		rsi
	jmp		loop

check_s1:
	cmp		byte [rsi], 0
	je		diff
	jmp		ret_zero

check_s2:
	cmp		byte [rdi], 0
	je		diff
	jmp		ret_zero

diff:
	movzx	rax, byte [rdi]
	sub		eax, edx
	ret

ret_zero:
	mov		rax, 0
	ret