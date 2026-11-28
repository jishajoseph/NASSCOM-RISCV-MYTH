.text
.globl load
.type load, @function
load:
    mv t0, a0
    li t1, 0
.Lcheck:
    bge t0, a1, .Ldone
    add t1, t1, t0
    addi t0, t0, 1
    j .Lcheck
.Ldone:
    mv a0, t1
    ret
.size load, .-load
