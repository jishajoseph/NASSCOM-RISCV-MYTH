# Register ABI Names

The standard RV32I/RV64I integer register file has 32 architectural registers. Five-bit instruction fields can select 2^5 = 32 registers.

| Registers | ABI names | Role |
|---|---|---|
| x0 | zero | Constant zero |
| x1 | ra | Return address |
| x2 | sp | Stack pointer |
| x3 | gp | Global pointer |
| x4 | tp | Thread pointer |
| x5–x7 | t0–t2 | Temporaries |
| x8–x9 | s0/fp, s1 | Saved registers |
| x10–x17 | a0–a7 | Arguments; a0/a1 also returns |
| x18–x27 | s2–s11 | Saved registers |
| x28–x31 | t3–t6 | Temporaries |

## Calling convention
A caller must preserve live caller-saved values if needed after a call. A callee must restore any callee-saved registers it modifies. The stack pointer must follow ABI alignment requirements. The hardware does not automatically enforce these software conventions.

Example: add a0, a0, a1 adds two arguments and leaves the result in the return register.

## Workshop reference
Topic sequence based on the [Day 2 workshop notes](https://github.com/chinmaya24163/NASSCOM-RISC-V-MYTH/tree/main/day2). Explanations and examples are independently written; no reference screenshots or results are reproduced.
