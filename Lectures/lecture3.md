# Summary of Lecture#3

#### Introduction

The third lecture of the course serves as the bridge between combinational logic and sequential logic. Professor Onur Mutlu transitions from basic building blocks like ALUs and Tri-State buffers into the foundational elements of computer memory: latches, flip-flops, and finite state machines.

#### Remaining Combinational Logic Blocks

The set of gates {AND, OR, NOT} is logically complete, meaning they can implement any truth table. Interestingly, a single NAND or NOR gate is also logically complete on its own.

- ##### Comparator

Checks if two N-input values are exactly the same or not.

- ##### ALU

The core of any processor. Mutlu explains how an ALU combines various arithmetic (addition, subtraction) and logic (AND, OR) operations into one unit, using a function code (opcode) to select the desired operation via multiplexers.

- ##### Tri-State Buffers

A critical component for communication. These buffers act as switches that can "float" (high impedance state), allowing multiple components (like a CPU and Memory) to share a single bus without causing short circuits.

- ##### Priority Circuits

Used to resolve conflicts when multiple devices request a resource (like a bus) simultaneously. Mutlu introduces the **Don't Care** (X) notation in truth tables to simplify these designs. If a priority given input is 1, the rest don't matter.

- ##### K-Maps

Pictorial way of simplifying the logic. 

#### Introduction to Sequential Logic

- has memory
- output depends on current as well as past values of the circuit

##### Need for memory

Combinational circuits have no "history". To build meaningful computers, we need circuits that can store state. The simplest storage element. While it can hold a bit (0 or 1), it is useless because it lacks a control mechanism to change the value.

#### Basic Storage Elements

- ##### R-S Latch

A controllable storage element with **Set** and **Reset** inputs. However, setting both to 0 is "forbidden" as it leads to an invalid state and potential metastability—where the circuit oscillates unpredictably.

- ##### Gated D Latch

Solves the forbidden state problem of the RS latch. It uses a **Write Enable** signal and a single data input (D). The output (Q) only updates when the Enable is high.

- ##### D Flip-Flop

The lecture highlights a flaw in the D Latch: it is **transparent** while the enable is high. To create a stable State Register, Mutlu introduces the D Flip-Flop, which combines two latches to ensure data is only captured at the rising edge of a clock.

#### Finite State Machines (FSM)

- ##### Concept of State

Mutlu uses the analogy of a sequential combination lock and a Swiss traffic light to explain how a system moves through a sequence of snapshots based on inputs.

- ##### Synchronous vs Asynchronous

While asynchronous systems(level-triggerred) exist, modern computers are synchronous(edge-triggerred), meaning state transitions are governed by a global clock. This makes design much more manageable and less prone to "race conditions".

- ##### FSM Structure

A Formal FSM consists of:

    1. Next State Logic (Combinational)

    2. State Register (Sequential/Flip-Flops)

    3. Output Logic (Combinational)

#### Memory Heirarchy and FPGA's

- ##### Memory Array

Mutlu demonstrates how to combine registers with decoders to create a memory array that can be addressed.

- ##### Look-up-Tables

A key concept for FPGAs. Instead of using logic gates to compute a function, a memory array stores the truth table, and the inputs act as an address to "look up" the result.