
# 60 - RV_D5SK3_L1 - Introduction to Load/Store Instructions and Lab to Redirect Loads

## Objective

The objective of this lecture is to understand memory access instructions and introduce pipeline control mechanisms for handling load latency.

## 1. Introduction to Load and Store Instructions

Load instructions transfer data from data memory to the register file.

Store instructions transfer data from the register file to data memory.

Example:

```asm
LW x5, 4(x1)
SW x2, 4(x1)
```

## 2. Memory Address Generation

The effective address is calculated using:

    Effective Address = Source Register 1 + Immediate

The existing ALU addition hardware can be reused for memory address generation.

## 3. Load-Use Hazard

Unlike ordinary ALU operations, load instructions may require additional clock cycles to retrieve data from memory.

Consider:

```asm
LW  x5, 0(x1)
ADD x6, x5, x2
```

The ADD instruction depends on the value loaded into x5.

If the ADD instruction reads x5 before the memory result becomes available, it may use an outdated value.

This creates a load-use hazard.

## 4. Load Shadow

The workshop processor introduces a load shadow to handle memory access latency.

The two instructions immediately following a valid load are invalidated.

These invalid instruction slots provide time for the load operation and subsequent register update.

Invalid instructions must not modify the architectural state of the processor.

## 5. PC Redirection

The invalidated instructions must be executed again to preserve correct program execution.

The processor redirects the program counter to the instruction immediately following the load.

    Redirected PC = Load PC + 4

This mechanism allows the invalidated instructions to be fetched again.

## 6. Pipeline Control Logic

The processor control logic is extended to support:

- Load instruction detection.
- Valid load identification.
- Load shadow generation.
- Instruction invalidation.
- PC redirection.
- Instruction replay.

## 7. Comparison Between Branch and Load Shadows

| Parameter | Branch Shadow | Load Shadow |
|-----------|---------------|-------------|
| Cause | Delayed branch decision | Memory access latency |
| Hazard | Control hazard | Load-use data hazard |
| Redirect address | Branch target | Load PC + 4 |
| Purpose | Correct instruction path | Correct operand availability |

## 8. Makerchip Implementation

### Stage 0 - Program Counter Redirection

![Stage 0 Implementation](images/lec60/Stage0.png)

### Stage 1 - Instruction Decoding

![Stage 1 Instruction Decode](images/lec60/Stage1_pic1.png)

### Stage 1 - Additional Control Logic

![Stage 1 Control Logic](images/lec60/Stage1_pic2.png)

### Stages 2 and 3 - Pipeline Control and Visualization

![Stages 2 and 3](images/lec60/Stage2_3.png)

## 9. Scope of the Lab

This lecture introduces the control mechanisms required to handle load instructions.

Actual memory data retrieval and load register writeback are not yet implemented in this lab.

The focus is on preparing the pipeline for subsequent data memory integration.

## Learning Outcomes

Through this lecture, I learned:

- Load and store instruction functionality.
- Effective memory address calculation.
- Memory access latency.
- Load-use hazards.
- Load shadow creation.
- Instruction invalidation.
- PC redirection.
- Instruction replay mechanisms.

## Conclusion

Memory access instructions introduce additional timing dependencies in a pipelined processor.

The load shadow and PC redirection mechanisms help preserve correct instruction execution by invalidating and replaying instructions issued before load data becomes available.

This lab provides the foundation for implementing data memory access in subsequent lectures.

## References

- VSD RISC-V MYTH Workshop
- [Makerchip IDE](https://makerchip.com/)
- [RISC-V MYTH Workshop](https://github.com/stevehoover/RISC-V_MYTH_Workshop)
