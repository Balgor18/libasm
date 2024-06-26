
%define MACH_SYSCALL(nb)   0x2000000 | nb
%define STDOUT 1
%define WRITE 4


section .data
message :
    .string db "Hello", 10
    .len equ $ - message.string

section .text
    global start
    global _main

start:
    call _main
    ret

_main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    mov rdi, 1
    lea rsi, [rel message.string]
    mov rdx, message.len
    mov rax, MACH_SYSCALL(WRITE)
    syscall
    leave
    ret