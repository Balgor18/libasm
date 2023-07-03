bits 64

;     ssize_t	read(int fildes, void *buf, size_t nbyte);
;    - fildes is store inside the register [RDI]
;    - buf is store inside the register [RSI]
;    - nbyte is store inside the register [RDX]

%define MACH_SYSCALL(nb)   0x2000000 | nb ; Use for mac os
%define READ 0

global ft_read

ft_read:
	mov		rax, READ ; Check for a linux system
	mov		rbx, rdx
	syscall
	cmp		rax, 0
	jl		error
	mov		rax, rbx
	ret

error:
	mov		rax, -1
	ret