bits 64

;     size_t     strlen(const char *s);
;     - s is store inside the register [RDI]
;
;    [RAX] is the data i return

global ft_strlen

ft_strlen:
    xor		rax, rax
    jmp     check
    call    leave

check:
    cmp     BYTE [rdi + rax], 0
    jz		leave
    inc     rax
    jmp     check

leave:
    ret