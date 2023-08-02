bits 64

;    ssize_t     write(int fildes, const void *buf, size_t nbyte);
;    - fildes is store inside the register [RDI]
;    - buf is store inside the register [RSI]
;    - byte is store inside the register [RDX]

global ft_write

ft_write:
	mov		rax, WRITE; Check for a linux system
	mov		rbx, rdx
	syscall
	cmp		rax, 0
	jl		error
	mov		rax, rbx
	ret

error:
	mov		rax, -1
	ret