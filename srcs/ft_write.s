bits 64

;    ssize_t     write(int fildes, const void *buf, size_t nbyte);
;    - fildes is store inside the register [RDI]
;    - buf is store inside the register [RSI]
;    - byte is store inside the register [RDX]

%define MACH_SYSCALL(nb)   0x2000000 | nb ; Use for mac os
%define WRITE 4

global _ft_write

_ft_write:
	mov		rax, MACH_SYSCALL(WRITE); Check for a linux system
	mov		rbx, rdx
	syscall
	cmp		rax, 0
	jl		error
	mov		rax, rbx
	ret

error:
	mov		rax, -1
	ret