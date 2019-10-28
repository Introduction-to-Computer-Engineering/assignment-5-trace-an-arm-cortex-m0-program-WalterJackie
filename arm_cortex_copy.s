value:
        .word   6 ;constant 
negate:
        sub     sp, sp, #8 
        str     r0, [sp, #4] 
        ldr     r3, [sp, #4] 
        rsbs    r3, r3, #0 
        movs    r0, r3 
        add     sp, sp, #8 
        bx      lr 
main:
        push    {r4, lr} ;pushes r4 and lr to the stack
        ldr     r3, .L6 ;loads register 3 with .L6 (see .L6)
        ldr     r3, [r3] ;loads register 3 with mem word at r3
        cmp     r3, #0 ;compares r3 with #0 
        ble     .L4 ;causes a branch to .L4
        ldr     r3, .L6 ;loads register 3 with .L6
        ldr     r3, [r3] ;loads register 3 with mem word at r3
        movs    r0, r3 
        bl      negate 
        movs    r2, r0 
        ldr     r3, .L6 
        str     r2, [r3] 
.L4:
        movs    r3, #0 
        movs    r0, r3 
        pop     {r4, pc} 
.L6:
        .word   value 
