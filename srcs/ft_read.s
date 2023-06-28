;     ssize_t	read(int fildes, void *buf, size_t nbyte);
;    - fildes is store inside the register [RDI]
;    - buf is store inside the register [RSI]
;    - nbyte is store inside the register [RDX]

global _ft_read
%define MACH_SYSCALL(nb)   0x2000000 | nb ; Use for mac os
%define STDIN 0
%define STDOUT 1
%define READ 3
%define WRITE 4

_ft_read:
	mov		rax, MACH_SYSCALL(READ) ; Check for a linux system
	mov		rbx, rdx
	syscall
	cmp		rax, 0
	jl		error
	mov		rax, rbx
	ret

error:
	mov		rax, -1
	ret