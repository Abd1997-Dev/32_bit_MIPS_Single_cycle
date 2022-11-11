# 32 bit MIPS Single cycle
The RTL Design of 32 bit Microprocessor without Interlocked Pipeline Stages (MIPS) architecture for a single cycle operation is discussed in this repository. Here, four instructions like ADD, ADDI, LW, and SW are executed using the hardware design.

1. The ADD instructions adds the data present in the two registers Source (rs) and Temporary (rt) and stores it in the Destination register (rd).
The corresponding instruction is used to execute the Register Type Addtion operation
```
"00001020"
```
The above instruction is expanded as follows
```
0000 0000 0000 0000 0001 0000 0010 0000
```
The following table represents the decoding of the R-Type instructions, (The values from the above instructions are also inserted into this table for understanding)

| bits | 31:26 | 25:21 | 20:16 | 15:11 | 10:6 | 5:0 |
| ------------- | ------------- |  ------------- |  ------------- |  ------------- |  ------------- |  ------------- |
| example | 000000 | 00000 | 00000 | 00010 | 00000 | 100000 |
| name | op | rs | rt | rd | shamt | funct |
| number of bits  | 6 | 5 | 5 | 5| 5 | 6|

from the above table, the decoded instruction is,
```
(r<sub> d </sub>)
