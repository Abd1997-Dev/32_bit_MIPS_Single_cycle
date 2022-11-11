# 32 bit MIPS Single cycle
The RTL Design of 32 bit Microprocessor without Interlocked Pipeline Stages (MIPS) architecture for a single cycle operation is discussed in this repository. Here, four instructions like ADD, ADDI, LW, and SW are executed using the hardware design.

1. The ADD instruction adds the data present in the two registers Source (rs) and Temporary (rt). It stores the result in the Destination register (rd). The corresponding example instruction is used to execute the Register Type Addtion operation
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
(rd) <- (rs) + (rt)
(r2) <- (r0) + (r0)
```

2. The ADDI instrcution adds the data present in the source register (rs) and Sign Extended Immediate (Imm) value represented in the last 16 bits of the instruction. It stores the result in the Destination register represented by (rt). The corresponding example instruction is used to execute the Immediate type Addtion operation.
```
20220004
```
The above instruction is expanded as follows
```
0010 0000 0010 0010 0000 0000 0000 0100
```
The following table represents the decoding of the I-Type ADD instructions, (The values from the above instructions are also inserted into this table for understanding)

| bits | 31:26 | 25:21 | 20:16 | 15:0 |
| ------------- | ------------- |  ------------- |  ------------- |  ------------- |
| example | 001000 | 00001 | 00010 | 0000_0000_0000_0100 |
| name | op | rs | rt | Imm |
| number of bits  | 6 | 5 | 5 | 16 |

from the above table, the decoded instruction is,
```
(rt) <- (rs) + Imm
(r2) <- (r1) + 4
```

3. The LW instruction loads the data present in the memory location represented by addding the data in the source register (rs) and Sign Extended Immediate (Imm) into the register represented by rt. The corresponding example instruction is used to execute the Immediate type Load Word operation.
```
8C010001
```
The above instruction is expanded as follows
```
1000 1100 0000 0001 0000 0000 0000 0001
```
The following table represents the decoding of the I-Type Load Word instructions, (The values from the above instructions are also inserted into this table for understanding)

| bits | 31:26 | 25:21 | 20:16 | 15:0 |
| ------------- | ------------- |  ------------- |  ------------- |  ------------- |
| example | 100011 | 00000 | 00001 | 0000_0000_0000_0001 |
| name | op | rs | rt | Imm |
| number of bits  | 6 | 5 | 5 | 16 |

from the above table, the decoded instruction is,
```
(rt) <- mem[(rs) + Imm]
(r1) <- mem[(r0) + 1]
```

4. The SW instruction stores the data present in the register represented by rt into the memory location represented by addding the data in the source register (rs) and Sign Extended Immediate (Imm) . The corresponding example instruction is used to execute the Immediate type Store Word operation.
```
AC010001
```
The above instruction is expanded as follows
```
1010 1100 0000 0001 0000 0000 0000 0001
```
The following table represents the decoding of the I-Type Load Word instructions, (The values from the above instructions are also inserted into this table for understanding)

| bits | 31:26 | 25:21 | 20:16 | 15:0 |
| ------------- | ------------- |  ------------- |  ------------- |  ------------- |
| example | 101011 | 00000 | 00001 | 0000_0000_0000_0001 |
| name | op | rs | rt | Imm |
| number of bits  | 6 | 5 | 5 | 16 |

from the above table, the decoded instruction is,
```
mem[(rs) + Imm] <- (rt)
mem[(r0) + 1] <- (r1)
```

