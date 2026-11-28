# 65 – Workshop Wrap-Up and Future Opportunities

## Overview

The NASSCOM RISC-V MYTH Workshop connected software programming, instruction set architecture and processor hardware implementation using TL-Verilog and Makerchip.

## Key Concepts Covered

- RISC-V GNU toolchain, assembly programming, ABI, integer representation, objdump and Spike.
- Combinational and sequential logic, calculators, Fibonacci generation, pipelining and validity.
- Program counter, instruction fetch, decoding, register file, ALU, writeback and branch control.
- Pipeline dependencies, load redirection, delayed writeback and jump control.

## My Practical Implementations

I explored C and assembly programming using the RISC-V toolchain and Spike, then implemented digital logic and arithmetic pipelines in Makerchip. I progressively developed a basic processor with instruction fetch, decode, register access, arithmetic and branch execution.

The self-checking summation program successfully calculated the sum of integers from 1 to 9.

| Parameter | Result |
|---|---|
| Expected sum | 45 |
| Destination register | x10 |
| Hexadecimal value | 0x0000002D |
| Simulation status | PASSED |

This verifies the tested ADD, ADDI and BLT execution sequence, not full RV32I compliance.

I subsequently explored extended ALU operations, load redirection, delayed load writeback and JAL/JALR control through separate laboratory demonstrations. The load-writeback waveform showed the expected register values, and the jump-control waveform showed target calculation and shadow signals.

## Challenges Encountered

- TL-Verilog syntax, indentation and compilation errors.
- Interpreting hexadecimal waveform values, register indices and instruction fields.
- Understanding transaction alignment using earlier transaction references.
- Understanding forwarding, delayed writeback and invalidation of younger instructions.

## Current Implementation Status

| Component | Status |
|---|---|
| Basic CPU summation test | Simulation passed |
| Extended ALU | Comprehensive verification pending |
| Load redirection | Demonstration developed |
| Load writeback | Waveform verified |
| JAL and JALR control | Waveform and datapath generated |
| Complete integrated pipelined CPU | Further integration required |
| Full RV32I compliance | Pending |
| FPGA implementation | Future work |

The later demonstrations are standalone exercises rather than a fully verified integrated CPU. Final PASS logs for the load and jump demonstrations have not been recorded in the documentation.

## Future Opportunities

1. Integrate the individual implementations and verify RV32I instructions and corner cases.
2. Implement byte, half-word and word memory operations.
3. Compare execution against Spike and explore RISC-V architecture tests.
4. Prototype the processor on an FPGA and measure resource utilization, frequency and power.
5. Explore interrupts, exceptions, caches, branch prediction and RTL-to-GDSII implementation.
6. Investigate custom instructions, vector extensions and hardware accelerator interfaces.

## Relevance to My PhD Research

My research focuses on a RISC-V-based hardware accelerator for anomaly detection in autonomous security systems. The workshop provides a foundation for understanding processor datapaths, instruction execution, pipeline timing and hardware integration.

I intend to explore custom neural-network instructions, multiply-accumulate accelerators, efficient CNN and GRU execution, INT8 inference, RISC-V vector processing and memory-efficient surveillance video processing. Future work includes investigating SHAKTI and VEGA processor integration and FPGA-based hardware-software co-design for low-latency edge video anomaly detection.

## Conclusion

The workshop provided practical experience connecting algorithms, software instructions and hardware execution. The basic verified CPU and subsequent laboratory demonstrations provide a starting point for further processor verification, FPGA prototyping and domain-specific accelerator development.

## Acknowledgement

I acknowledge NASSCOM, VLSI System Design (VSD), the Makerchip team and the workshop instructors for the learning resources and laboratory exercises.

## References

- [VLSI System Design](https://www.vlsisystemdesign.com/)
- [Makerchip](https://makerchip.com/)
- [RISC-V MYTH Workshop](https://github.com/stevehoover/RISC-V_MYTH_Workshop)
- [RISC-V International](https://riscv.org/)
