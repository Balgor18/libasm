bits 64

;	char *		strdup(const char *s1);
;	- s1 is store inside the register [RDI]

global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
	push rdi
	call ft_strlen
	inc rax
	mov rdi, rax; 
	call malloc wrt ..plt
	cmp	rax, 0
	jz	error
	pop rcx
	mov rdi, rax;
	mov rsi, rcx
	jmp ft_strcpy
	ret

error:
	mov		rax, -1
	ret