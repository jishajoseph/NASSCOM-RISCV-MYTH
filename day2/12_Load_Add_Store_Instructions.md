# Load, Add and Store Instructions

## RV64 worked example
Assume s2 points to an aligned array of three double words containing 7, 11 and 19.

```asm
ld t0, 0(s2)
ld t1, 16(s2)
add t2, t0, t1
sd t2, 8(s2)
```

The effective address is the base register plus the sign-extended immediate. The expected array after execution is 7, 26, 19.

| Instruction | Format | Operation |
|---|---|---|
| ld | I | Read 8 bytes into rd |
| add | R | Add rs1 and rs2 |
| sd | S | Write 8 bytes from rs2 |

## Encoding
R-type: funct7[31:25], rs2[24:20], rs1[19:15], funct3[14:12], rd[11:7], opcode[6:0].
I-type: imm[31:20], rs1, funct3, rd, opcode.
S-type: imm[11:5], rs2, rs1, funct3, imm[4:0], opcode.

LD and SD are RV64 instructions; RV32 uses word operations such as LW and SW for 32-bit values. This is a worked example, not a captured simulation.

## Workshop reference
Topic sequence based on the [Day 2 workshop notes](https://github.com/chinmaya24163/NASSCOM-RISC-V-MYTH/tree/main/day2). Explanations and examples are independently written; no reference screenshots or results are reproduced.
