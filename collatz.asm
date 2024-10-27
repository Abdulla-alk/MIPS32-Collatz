    .text
    .globl main

main:
    li      $v0, 5
    syscall
    move    $t0, $v0
    j       loop

loop:
    move    $a0, $t0
    li      $v0, 1
    syscall
    li      $t1, 1
    beq     $t0, $t1, exit

    and     $t1, $t0, 1
    beq     $t1, $zero, even
    j       odd

even:
    srl     $t0, $t0, 1
    j       loop

odd:
    move    $t2, $t0
    add     $t2, $t0, $t0
    add     $t0, $t2, $t0
    addi    $t0, $t0, 1
    j       loop

exit:
    li      $v0, 10
    syscall
