bits 64

;    ssize_t     write(int fildes, const void *buf, size_t nbyte);
;    - fildes is store inside the register [RDI]
;    - buf is store inside the register [RSI]
;    - byte is store inside the register [RDX]

global ft_write
extern __errno_location

ft_write:
	mov		rax, 4; Check for a linux system
	mov		rbx, rdx
	syscall
	cmp		rax, 0
	jl		error
	mov		rax, rbx
	ret

error:
	neg		rax
	mov		rdi, rax
	call	__errno_location wrt ..plt
	mov		rax, rdi
	mov		rax, -1
	ret