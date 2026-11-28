# Lecture 60 – Companion exercise: Complete Decode and ALU

The supplied lecture notes label this topic 33 (D5SK3_L1). This companion file is separate from the load-replay exercise.

## Objective

Extend instruction recognition and evaluate arithmetic, logic, shifts, comparisons and upper-immediate operations using independent test vectors.

[Makerchip TL-Verilog source](../src/lec60_complete_decode_alu.tlv)

## Design

- Stage 0: encoded test instructions and test PC.
- Stage 1: opcode, function fields, immediate reconstruction and instruction flags.
- Stage 2: generated operands, signed/unsigned comparisons and shift preparation.
- Stage 3: ALU result and self-checking comparison.

The compact decoder combines instruction bit 30, funct3 and opcode. It assumes legal encodings; it is not an illegal-instruction detector. RV32I shift amounts use five bits. Arithmetic right shift preserves the sign. SLTIU sign-extends its immediate before unsigned comparison.

## Expected test results

| ID | Instruction | Expected result (hex) |
|---:|---|---|
| 0 | ADD | `00000011` |
| 1 | SUB | `00000007` |
| 2 | AND | `00000004` |
| 3 | OR | `0000000d` |
| 4 | XOR | `00000009` |
| 5 | SLL | `00000014` |
| 6 | SRL | `00000005` |
| 7 | SRA | `fffffffe` |
| 8 | SLT | `00000001` |
| 9 | SLTU | `00000000` |
| 10 | ADDI | `00000011` |
| 11 | ANDI | `00000004` |
| 12 | ORI | `0000000d` |
| 13 | XORI | `00000009` |
| 14 | SLLI | `00000014` |
| 15 | SRLI | `00000005` |
| 16 | SRAI | `fffffffe` |
| 17 | SLTI | `00000001` |
| 18 | SLTIU | `00000000` |
| 19 | LUI | `12345000` |
| 20 | AUIPC | `00001050` |
| 21 | JAL | `00000058` |
| 22 | JALR | `0000005c` |

## Implementation scope

The source contains all 19 computational operations, LUI, AUIPC and JAL/JALR link-value calculations. Six branch conditions and load/store decoding are included but not exercised by these vectors. Loads are grouped by opcode. There is no actual register file, memory access, branch or jump PC redirection. FENCE, ECALL and EBREAK are excluded.

## Verification

Makerchip compilation and simulation are pending. The expected values above are not captured results. No external tests or screenshots from another repository are claimed.

Open the source in [Makerchip](https://makerchip.com/), compile, and inspect the test ID, instruction, decoder flags, result, expected value, test_ok and error_seen. Save your own waveform, diagram and log before marking the exercise verified.

## References

- VSD RISC-V MYTH Workshop
- [Workshop resources](https://github.com/stevehoover/RISC-V_MYTH_Workshop)
