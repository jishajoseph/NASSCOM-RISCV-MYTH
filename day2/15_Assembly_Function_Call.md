# Assembly Function Call

## C and assembly integration
The C caller declares an external function; the linker resolves its definition from the assembly source.

### sum_main.c
```c
#include <stdio.h>
extern int load(int start, int end);
int main(void)
{
    int count = 9;
    int result = load(0, count + 1);
    printf("sum from 1 to %d is %d\n", count, result);
    return 0;
}
```

### load.S
```asm
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
```

Arguments arrive in a0 and a1; t0 and t1 are caller-saved temporaries. The leaf routine returns through ra without modifying saved registers. This example assumes small signed integer inputs with no overflow.

Source files: [C program](../src/day2/sum_main.c), [assembly routine](../src/day2/load.S). Expected result: 45. The replacement example has not been run in the user's VM.

## Workshop reference
Topic sequence based on the [Day 2 workshop notes](https://github.com/chinmaya24163/NASSCOM-RISC-V-MYTH/tree/main/day2). Explanations and examples are independently written; no reference screenshots or results are reproduced.
