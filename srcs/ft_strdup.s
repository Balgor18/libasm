bits 64

;	char *		strdup(const char *s1);
;	- s1 is store inside the register [RDI]

global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
	call ft_strlen
	mov rdi, rsi
	mov rax, rdi
	call malloc
	mov rax, rdi
	jmp ft_strcpy
	ret
