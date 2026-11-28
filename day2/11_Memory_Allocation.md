# Memory Allocation for Double Words

RV64 integer registers are 64 bits wide. Memory is byte-addressed, so a double word occupies eight consecutive addresses.

## Worked example
For a little-endian system, store 0x1122334455667788 at address 0x1000:

| Address | Byte (hex) |
|---|---|
| 1000 | 88 |
| 1001 | 77 |
| 1002 | 66 |
| 1003 | 55 |
| 1004 | 44 |
| 1005 | 33 |
| 1006 | 22 |
| 1007 | 11 |

The next naturally aligned double word begins at 0x1008. Three consecutive double words occupy 24 bytes. Big-endian ordering reverses the byte arrangement; the workshop examples use little-endian operation.

## Hardware connection
The load/store unit calculates an address, accesses the required bytes and transfers the reconstructed value to or from the register file. Registers provide limited fast storage; memory holds larger data structures.

## Workshop reference
Topic sequence based on the [Day 2 workshop notes](https://github.com/chinmaya24163/NASSCOM-RISC-V-MYTH/tree/main/day2). Explanations and examples are independently written; no reference screenshots or results are reproduced.
