global _ft_strlen

_ft_strlen:
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