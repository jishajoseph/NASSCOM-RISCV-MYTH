# C and Assembly Simulation

## Build and execute
Use the two source files from the preceding exercise in the same directory.

```bash
riscv64-unknown-elf-gcc -O2 -march=rv64imac -mabi=lp64 -o sum.elf sum_main.c load.S
spike pk sum.elf
riscv64-unknown-elf-objdump -d sum.elf | less
```

The compiler ISA and ABI options must match the installed runtime libraries and proxy kernel. If the toolchain uses another supported multilib, adjust the flags accordingly.

Expected terminal output:
```text
sum from 1 to 9 is 45
```

## Troubleshooting
An undefined reference to load occurs when the assembly definition is not linked, or its symbol is not exported. Compiling the C file alone with host gcc does not build the RISC-V assembly routine. Use the cross compiler and include both sources.

Inspect the disassembly for the call to load, loop branches and return instruction. The commands and expected output are provided for reproduction; no new execution log is claimed.

## Workshop reference
Topic sequence based on the [Day 2 workshop notes](https://github.com/chinmaya24163/NASSCOM-RISC-V-MYTH/tree/main/day2). Explanations and examples are independently written; no reference screenshots or results are reproduced.
