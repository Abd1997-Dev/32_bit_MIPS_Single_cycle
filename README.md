# 32 bit MIPS Single cycle
The RTL Design of 32 bit Microprocessor without Interlocked Pipeline Stages (MIPS) architecture for a single cycle operation is discussed in this repository. Here, four instructions like ADD, ADDI, LW, and SW are executed using the hardware design for simple and clear understanding.

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

The hardware design present in the theory to execute the above four instructions is as follows,

<p align="center">
<img src="https://user-images.githubusercontent.com/73669849/201391642-509b9af4-e301-4bad-8ee0-006c9b908b0f.png" width="600" height="300">
</p>
<p align = "center">
Fig. 1 - Hardware Design of MIPS Architecture
</p>


The Schematic obtained from our RTL design is as follows,

<p align="center">
<img src="https://user-images.githubusercontent.com/73669849/201392836-87bf0cf2-ff1d-4936-8da9-9bcf7220edb8.png" width="1000" height="400">
</p>
<p align = "center">
Fig. 2 - Schematic of MIPS Architecture
</p>

The RTL Design is simulated for 600 ns and each 200 ns output waveform is displayed here,<br>
<br>
**0 ns to 200 ns,**

<p align="center">
<img src="https://user-images.githubusercontent.com/73669849/201394199-257c4738-ccf1-4be4-a8f5-cd63c30a0e72.png" width="900" height="500">
</p>
<p align = "center">
Fig. 3 - Simulation output from 0 ns to 200 ns
</p>

from **200 ns to 400 ns,**

<p align="center">
<img src="https://user-images.githubusercontent.com/73669849/201394956-8066d8a6-2f96-42a1-978c-2a14148b2a1f.png" width="900" height="500">
</p>
<p align = "center">
Fig. 4 - Simulation output from 200 ns to 400 ns
</p>

from **400 ns to 600 ns,**

<p align="center">
<img src="https://user-images.githubusercontent.com/73669849/201395841-fa3884b6-b530-4588-99eb-ab11663d4cd8.png" width="900" height="500">
</p>
<p align = "center">
Fig. 5 - Simulation output from 400 ns to 600 ns
</p>

# Conclusion
As discussed, the hardware is designed to execute all the above four instructions. The hardware based on the theory is referred to design this RTL Design and the schematic of the design also presented in the above document. The three simulation instances are captured and presented above.

# Further Works
1. The instructions are working well, but there are some hazards at the starting of the next instruction.
2. The timings should be well utilized.
3. The concept of Pipelining should be incurred to better use the hardware.

#Reference
1. John L. Hennessy and David A. Patterson, "Computer Architecture: A Quantitative Approach", Morgan Kaufmann Publishers, ISBN 978-0-12-383872-8.
