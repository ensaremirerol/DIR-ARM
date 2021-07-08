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


## Supported Operations

- add / Adds two registers
- add imm / Adds one register and immediate value
- sub / Subtracts two registers 
- sub imm / Subtracts one register and one immediate 
- and / Ands two registers
- and imm / Ands one register and one immediate
- or / Ors two registers
- or imm / Ors one register and one immediate
- shift left / Shifts left a register according to value in register
- shift left imm / Shifts left a register according to immediate value
- shift right /Shifts right a register according to value in register
- shift right imm / Shifts right a register according to immediate value
- rotate left / Rotates left a register according to value in register
- rotate left imm / Rotates left a register according to immediate value
- rotate right / Rotates right a register according to value in register
- rotate right imm / Rotates right a register according to immediate value
- ldr / Loads a value from memory and writes to the Register file
- ldr imm / Writes immediate value to register file
- str / Writes a value from register file to Data Memory
- str imm / Writes the immediate value to Date Memory
- cmp / Compares two registers (Sets flags)
- cmp imm / Compares a register and immediate value (Sets flags)
- push / Push a register to stack
- push pc / Push PC+2 to stack
- pop / Pop from stack
- ret / Pop from stack and use it as new PC value
- jmp / Jump to new PC address
- skp / Set PC to (PC+2 + Imm)

## Modules

### Control Unit
#### Main Decoder

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

#### ALU Decoder

| ALUOP | ALUSrc | Func1:0 | Func2 | Type | dNow | AluControl | FlagW |
|-------|--------|---------|-------|------|------|------------|-------|
| 0     | X      | X       | X     | NOP  | 0    | 00         | 00    |
| 1     | 0      | X       | X     | CMP  | 1    | 01         | 11    |
|       |        | 00      | 0     | ADD  | 0    | 00         | 00    |
|       |        |         | 1     |      | 0    |            | 11    |
|       |        | 01      | 0     | SUB  | 0    | 01         | 00    |
|       |        |         | 1     |      | 0    |            | 11    |
|       |        | 10      | 0     | AND  | 0    | 10         | 00    |
|       |        |         | 1     |      | 0    |            | 01    |
|       |        | 11      | 0     | OR   | 0    | 11         | 00    |
|       |        |         | 1     |      | 0    |            | 01    |
| 1     | 1      | 00      | X     | SHL  | 0    | 00         | 0     |
|       |        |         |       |      | 0    |            | 0     |
|       |        | 01      |       | SHR  | 0    | 01         | 0     |
|       |        |         |       |      | 0    |            | 0     |
|       |        | 10      |       | ROL  | 0    | 10         | 0     |
|       |        |         |       |      | 0    |            | 0     |
|       |        | 11      |       | ROR  | 0    | 11         | 0     |
|       |        |         |       |      | 0    |            | 0     |
|       |        |         |       |      |      |            | COND  |

Note: Signals that marked as COND are routed to Conditional Logic Module. Others goes DataPath right away.


#### Conditional Logic

##### Conditions
Conditions checks flags saved in Control Unit and executes operation according to them.
All Conditions and their requirements listed in following table
| Condition                    | Mnemonic | Cond. Code | CondEx       | 
|------------------------------|----------|------------|--------------|
| EQUAL                        | EQ       | 0000       | Z==1         | 
| NOT EQUAL                    | NE       | 0001       | Z==0         | 
| CARRY SET                    | CS       | 0010       | C==1         | 
| CARRY CLEAR                  | CC       | 0011       | C==0         | 
| MINUS                        | MI       | 0100       | N==1         | 
| PLUS                         | PL       | 0101       | N==0         | 
| oVerflow SET                 | VS       | 0110       | V==1         | 
| oVerflow CLEAR               | VC       | 0111       | V==0         | 
| UNSIGNED HIGHER              | HI       | 1000       | C==1 && Z\==0 | 
| UNSIGNED LOWER OR SAME       | LS       | 1001       | C==0 || Z\==1 | 
| SIGNED GREATER THAN OR EQUAL | GE       | 1010       | N==V         | 
| SIGNED LESS THAN             | LT       | 1011       | N!=V         | 
| SIGNED GREATER THAN          | GT       | 1100       | Z==0 && N\==V | 
| SIGNED LESS THAN OR EQUAL    | LE       | 1101       | Z==1 || N!=V | 
| ALLOW(NOP)                   | AL       | 1110       | 1            | 

Note: Condition Code 15(b1111) is ALLOW too.

Conditional logic checks flags according to the given condition code. If the condition is met, Condition logic module passes signals marked as COND.

Note: Condition Logic has a signal named "NoWrite". If that signal is high, no memory operation is allowed.

#### PCPlus

Increments given value by 1.

#### PCControl

Outputs the current PC value and selects the next PC value using PCSRC signal. Outputs the next PC at clocks rising edge.

#### InstructionMemory

Keeps Instructions and Outputs the instruction at PC address. Instructions are 25 bits.

#### Instruction

Splits given Instruction according to the Instruction Format

- 24-21 Condition
- 20-17 OPCode
- 16-14 Function
- 13-11 RD
- 10-8 RA
- 7-5 RB
- 7-0 Imm

#### SPController
This Processor uses Data Memories' top addresses as Stack. And SPController points to stacks current position in Data Memory.

Stack grows downwards. 

At the clocks' rising edge if push signal is 1, SPController decrements Stack Pointer by 1.

At the clocks' falling edge if pop signal is 1, SPController increments Stack Pointer by 1.


#### Register File(register)

Register File consists of 8 Register. Register 7 reserved for PC+2 and Register 6 reserved for Stack Pointer.

#### ALU

ALU can do following operations:
- ADD
- SUB
- AND
- OR

ALU' s default operation is ADD

#### Shifter

Shifter can do following operations:
- Shift left
- Shift right
- Rotate left
- Rotate right

#### DataMemory

DataMemory's inputs are:
- Address
- Write Enable
- Write Data
- Read Data

It has 8 bit address space. Stores 8bit words.

# Example Program

This program calculates 14th value of Fibonacci series.

25'b1110_1010_000_000_000_00000000; // LDR IMM R0 0


25'b1110_1010_000_001_000_00000001; // LDR IMM R1 1


25'b1110_1010_000_010_000_00000000; // LDR IMM R2 0     (Loop Counter)


25'b1110_1010_000_011_000_00001101; // LDR IMM R3 13    (Calculate 13+1 th value of Fibonacci series)


25'b1110_1101_000_000_000_00000000; // PUSH PC          (Prepare for jump)


25'b1110_0111_000_000_000_00001010; // JMP 10(a)        (Jump to a)


25'b1110_0100_000_000_011_010_00000; // CMP R3 R2


25'b0000_1111_000_000_000_00000000; // EQ SKP 0


25'b1110_0111_000_000_000_00000100; // JMP 4


25'b1110_0111_000_000_000_00000000; // JMP 0


25'b1110_0000_000_100_000_001_00000; // ADD R4 R0 R1(a) (R4=R0+R1)


25'b1110_0101_000_001_000_00000000; // PUSH R1          (Write new values)


25'b1110_0101_000_100_000_00000000; // PUSH R4


25'b1110_0110_000_001_000_00000000; // POP R1


25'b1110_0110_000_000_000_00000000; // POP R0


25'b1110_1000_000_010_010_00000001; // ADD IMM R2 R2 1  (Increment loop counter)


25'b1110_1110_000_000_000_00000000; // RET              (Return from subroutine)
