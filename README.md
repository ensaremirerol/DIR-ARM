# DIR- ARM
Term project of Digital Computer Design course.

## Instruction formats

|        |  COND | OP    | FUNC  | RD    | RA    | RB    | DC    |
|--------|-------|-------|-------|-------|-------|-------|-------|
| DP R   | 4BITS | 4BITS | 3BITS | 3BITS | 3BITS | 3BITS | 5BITS |
|        |       |       |       |       |       |       |       |
|        | COND  | OP    | FUNC  | RD    | RA    | IMM   |       |
| DP IMM | 4BITS | 4BITS | 3BITS | 3BITS | 3BITS | 8BITS |       |
|        |       |       |       |       |       |       |       |
|        | COND  | OP    | DC    |       |       | IMM   |       |
| B      | 4BITS | 4BITS | 9BITS |       |       | 8BITS |       |

## Conditions
Conditions checks flags saved in Control Unit and executes operation according to them.
All Conditions and their requirements listed in following table
| Condition                    | Mnemonic | CondEx       |
|------------------------------|----------|--------------|
| EQUAL                        | EQ       | Z==1         |
| NOT EQUAL                    | NE       | Z==0         |
| CARRY SET                    | CS       | C==1         |
| CARRY CLEAR                  | CC       | C==0         |
| MINUS                        | MI       | N==1         |
| PLUS                         | PL       | N==0         |
| oVerflow SET                 | VS       | V==1         |
| oVerflow CLEAR               | VC       | V==0         |
| UNSIGNED HIGHER              | HI       | C==1 && Z==0 |
| UNSIGNED LOWER OR SAME       | LS       | C==0 || Z==1 |
| SIGNED GREATER THAN OR EQUAL | GE       | N==V         |
| SIGNED LESS THAN             | LT       | N!=V         |
| SIGNED GREATER THAN          | GT       | Z==0 && N==V |
| SIGNED LESS THAN OR EQUAL    | LE       | Z==1 || N!=V |
| ALLOW(NOP)                   | AL       | 1            |


## Operation Codes
Supported operations and their signals listed in following table

### Main Decoder

| OP3 | OP2:0 | Op name        | PCS  | ResultSel | MEMW | ImmSrc | ZeroSrc | REGW | REGSrc | dNOW | dPOP | dPUSH | MEMWD | ALUOP | ALUSrc |
|-----|-------|----------------|------|-----------|------|--------|---------|------|--------|------|------|-------|-------|-------|--------|
| 0   | 000   | alu op         | 0    | 00        | 0    | 0      | 0       | 1    | 000    | 0    | 0    | 0     | 00    | 1     | 0      |
| 1   | 000   | alu imm op     | 0    | 00        | 0    | 1      | 0       | 1    | 00X    | 0    | 0    | 0     | 00    | 1     | 0      |
| 0   | 001   | shifter op     | 0    | 00        | 0    | 0      | 0       | 1    | 000    | 0    | 0    | 0     | 00    | 1     | 1      |
| 1   | 001   | shifter imm op | 0    | 00        | 0    | 1      | 0       | 1    | 00X    | 0    | 0    | 0     | 00    | 1     | 1      |
| 0   | 010   | ldr            | 0    | 01        | 0    | 1      | 0       | 1    | 00X    | 0    | 0    | 0     | 00    | 0     | 0      |
| 1   | 010   | ldr imm        | 0    | 10        | 0    | X      | 1       | 1    | 00X    | 0    | 0    | 0     | 00    | 0     | 0      |
| 0   | 011   | str            | 0    | XX        | 1    | 1      | 0       | 0    | 001    | 0    | 0    | 0     | 00    | 0     | 0      |
| 1   | 011   | str imm        | 0    | XX        | 1    | X      | 1       | 0    | 00X    | 0    | 0    | 0     | 01    | 0     | 0      |
| 0   | 100   | cmp            | 0    | XX        | 0    | 0      | 0       | 0    | 000    | 1    | 0    | 0     | 00    | 1     | 0      |
| 1   | 100   | cmp imm        | 0    | XX        | 0    | 1      | 0       | 0    | 00X    | 1    | 0    | 0     | 00    | 1     | 0      |
| 0   | 101   | push           | 0    | XX        | 1    | X      | 1       | 0    | 101    | 0    | 0    | 1     | 00    | 0     | 0      |
| 1   | 101   | push pc        | 0    | XX        | 1    | X      | 1       | 0    | 100    | 0    | 0    | 1     | 10    | 0     | 0      |
| 0   | 110   | pop            | 0    | 01        | 0    | X      | 1       | 1    | 100    | 0    | 1    | 0     | 00    | 0     | 0      |
| 1   | 110   | ret            | 1    | 01        | 0    | X      | 1       | 0    | 100    | 0    | 1    | 0     | 00    | 0     | 0      |
| 0   | 111   | jmp            | 1    | 10        | 0    | X      | 1       | 0    | XXX    | 0    | 0    | 0     | 00    | 0     | 0      |
| 1   | 111   | skp            | 1    | 00        | 0    | 1      | 0       | 0    | 010    | 0    | 0    | 0     | 0     | 0     | 0      |
|     |       |                | COND |           | COND |        |         | COND |        | COND | COND | COND  |       |       |        |

### ALU Decoder

| ALUOP | ALUSrc | Func1:0 | Func2 | Type | AluControl | FlagW |
|-------|--------|---------|-------|------|------------|-------|
| 0     | X      | X       | X     | NOP  | 00         | 0     |
| 1     | 0      | 00      | 0     | ADD  | 00         | 0     |
|       |        |         | 1     |      |            | 1     |
|       |        | 01      | 0     | SUB  | 01         | 0     |
|       |        |         | 1     |      |            | 1     |
|       |        | 10      | 0     | AND  | 10         | 0     |
|       |        |         | 1     |      |            | 1     |
|       |        | 11      | 0     | OR   | 11         | 0     |
|       |        |         | 1     |      |            | 1     |
| 1     | 1      | 00      | X     | SHL  | 00         | 0     |
|       |        |         |       |      |            | 0     |
|       |        | 01      |       | SHR  | 01         | 0     |
|       |        |         |       |      |            | 0     |
|       |        | 10      |       | ROL  | 10         | 0     |
|       |        |         |       |      |            | 0     |
|       |        | 11      |       | ROR  | 11         | 0     |
|       |        |         |       |      |            | 0     |
|       |        |         |       |      |            | COND  |

Note: Signals that marked as COND are routed to Conditional Logic Module. Others goes DataPath right away.

## Modules that need to be explained

### SPController
This Processor uses Data Memories' top addresses as Stack. And SPController points to stacks current position in Data Memory.

Stack grows downwards. 

At clocks' rising edge if push signal is 1, SPController decrements Stack Pointer by 1.

At clocks' falling edfe if pop signal is 1, SPController increments Stack Pointer by 1.