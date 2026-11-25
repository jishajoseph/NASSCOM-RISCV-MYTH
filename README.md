# NASSCOM RISC-V Based MYTH Program



## Introduction



This repository documents my learning journey through the NASSCOM RISC-V based MYTH (Microprocessor for You in Thirty Hours) Program.



I will be updating this repository throughout the workshop with lecture notes, laboratory exercises, source code, simulation results, technical observations and hardware implementations.



## Objectives



- Understand RISC-V Instruction Set Architecture (ISA).

- Explore the RISC-V GNU compiler toolchain.

- Understand processor microarchitecture.

- Learn digital logic design using TL-Verilog.

- Develop hardware designs using MakerChip.

- Understand processor pipelining and hazard handling.

- Implement and simulate a pipelined RISC-V processor.



## Workshop Progress



| Day | Topic | Status |

|---|---|---|

| Day 1 | Introduction to RISC-V ISA and GNU Compiler Toolchain | In Progress |

| Day 2 | Application Binary Interface and basic verification flow | Pending |

| Day 3 | Digital logic with TL-Verilog and MakerChip | Pending |

| Day 4 | Basic RISC-V CPU microarchitecture | Pending |

| Day 5 | Pipelined RISC-V CPU microarchitecture | Pending |



---



## Day 1 - Introduction to RISC-V ISA and GNU Compiler Toolchain

- [00 Introduction to RISCV](day1/00_Introduction_to_RISCV.md)
- [01 From Applications to Hardware](day1/01_From_Applications_to_Hardware.md)
- [02 Course Overview](day1/02_Course_Overview.md)
- [03 C Program Sum 1 to N](day1/03_C_Program_Sum_1_to_N.md)
- [04 RISCV GCC Compile and Disassemble](day1/04_RISCV_GCC_Compile_and_Disassemble.md)
- [05 Spike Simulation and Debug](day1/05_Spike_Simulation_and_Debug.md)
- [06 Unsigned Number Representation](day1/06_Unsigned_Number_Representation.md)
- [07 Signed Number Representation](day1/07_Signed_Number_Representation.md)
- [08 Signed and Unsigned Lab](day1/08_Signed_and_Unsigned_Lab.md)

---

## Day 2 - Application Binary Interface and Basic Verification Flow

- [09 Introduction to ABI](day2/09_Introduction_to_ABI.md)
- [10 Memory Allocation](day2/10_Memory_Allocation.md)
- [11 Load Add Store Instructions](day2/11_Load_Add_Store_Instructions.md)
- [12 Register ABI Names](day2/12_Register_ABI_Names.md)
- [13 Assembly Algorithm](day2/13_Assembly_Algorithm.md)
- [14 Assembly Function Call](day2/14_Assembly_Function_Call.md)
- [15 C Assembly Simulation](day2/15_C_Assembly_Simulation.md)
- [16 RISCV CPU Verification](day2/16_RISCV_CPU_Verification.md)

---

## Day 3 - Digital Logic with TL-Verilog and MakerChip

- [17 Introduction](day3/17_Introduction.md)
- [18 Logic Gates](day3/18_Logic_Gates.md)
- [19 Multiplexer and MakerChip](day3/19_Multiplexer_and_MakerChip.md)
- [20 Combinational Logic](day3/20_Combinational_Logic.md)
- [21 Sequential Logic](day3/21_Sequential_Logic.md)
- [22 Sequential Calculator](day3/22_Sequential_Calculator.md)
- [23 Timing](day3/23_Timing.md)
- [24 Pipelined Logic](day3/24_Pipelined_Logic.md)
- [25 Pipeline Error Conditions](day3/25_Pipeline_Error_Conditions.md)
- [26 Cycle Calculator](day3/26_Cycle_Calculator.md)
- [27 Validity](day3/27_Validity.md)
- [28 Valid When Condition](day3/28_Valid_When_Condition.md)
- [29 Total Distance](day3/29_Total_Distance.md)
- [30 Calculator with Validity](day3/30_Calculator_with_Validity.md)
- [31 Single Value Memory](day3/31_Single_Value_Memory.md)
- [32 Hierarchy](day3/32_Hierarchy.md)
- [33 Summary](day3/33_Summary.md)

---

## Day 4 - Basic RISC-V CPU Microarchitecture

- [34 Single Cycle RISCV CPU](day4/34_Single_Cycle_RISCV_CPU.md)
- [35 Verilog Lab Part1](day4/35_Verilog_Lab_Part1.md)
- [36 Verilog Lab Part2](day4/36_Verilog_Lab_Part2.md)
- [37 Program Counter](day4/37_Program_Counter.md)
- [38 Instruction Fetch](day4/38_Instruction_Fetch.md)
- [39 Instruction Type Decode](day4/39_Instruction_Type_Decode.md)
- [40 Immediate Decode](day4/40_Immediate_Decode.md)
- [41 Instruction Field Decode](day4/41_Instruction_Field_Decode.md)
- [42 Instruction Formats](day4/42_Instruction_Formats.md)
- [43 Individual Instruction Decode](day4/43_Individual_Instruction_Decode.md)
- [44 Register File Read](day4/44_Register_File_Read.md)
- [45 Register File Lab](day4/45_Register_File_Lab.md)
- [46 ALU Operations](day4/46_ALU_Operations.md)
- [47 Register File Write](day4/47_Register_File_Write.md)
- [48 Register File Architecture](day4/48_Register_File_Architecture.md)
- [49 Branch Instructions](day4/49_Branch_Instructions.md)
- [50 Branch Control](day4/50_Branch_Control.md)
- [51 CPU Testbench](day4/51_CPU_Testbench.md)

---

## Day 5 - Pipelined RISC-V CPU Microarchitecture

- [52 Control and Data Hazards](day5/52_Control_and_Data_Hazards.md)
- [53 Cycle Valid Signal](day5/53_Cycle_Valid_Signal.md)
- [54 Invalid Cycles](day5/54_Invalid_Cycles.md)
- [55 Pipeline Logic Distribution](day5/55_Pipeline_Logic_Distribution.md)
- [56 RAW Hazard](day5/56_RAW_Hazard.md)
- [57 Branch Target Correction](day5/57_Branch_Target_Correction.md)
- [58 Complete Instruction Decode](day5/58_Complete_Instruction_Decode.md)
- [59 Complete ALU](day5/59_Complete_ALU.md)
- [60 Load Store Instructions](day5/60_Load_Store_Instructions.md)
- [61 Memory to Register File](day5/61_Memory_to_Register_File.md)
- [62 Data Memory Integration](day5/62_Data_Memory_Integration.md)
- [63 Load Store Test Program](day5/63_Load_Store_Test_Program.md)
- [64 Jump Control Logic](day5/64_Jump_Control_Logic.md)
- [65 Final CPU Implementation](day5/65_Final_CPU_Implementation.md)

---

## Tools and Technologies



- RISC-V GNU Toolchain

- Spike ISA Simulator

- Icarus Verilog

- TL-Verilog

- MakerChip IDE

- Linux



## Final Project



Design and implementation of a pipelined RISC-V processor.



Source code, processor architecture, simulation waveforms and MakerChip project links will be added upon completion.



## Research Relevance



This workshop supports my doctoral research on RISC-V based hardware acceleration for video anomaly detection in autonomous security systems.



## Author



**Jisha Joseph**



PhD Research Scholar  

Rajagiri School of Engineering and Technology  

Kochi, Kerala, India



## Acknowledgements



NASSCOM, MYTH Program organizers, instructors and mentors.



## Repository Status



This repository is actively being updated as I progress through the workshop.



