# Summary of Lecture#5

#### Introduction

This lecture covers advanced Verilog syntax, the differences between structural and behavioral modeling, and how to implement sequential logic and Finite State Machines (FSMs).

#### Advanced Verilog Syntax

- ##### Bit Slicing & Concatenation

Techniques for assigning partial buses and combining multiple signals into a single vector.

- ##### Duplication

Using the {n{signal}} syntax to replicate bits easily.

- ##### Case Sensitivity

Verilog is case-sensitive, and names cannot start with numbers.

#### Design Methodologies

- ##### Structural Modeling

Describing a circuit by instantiating modules and connecting them like physical components.

- ##### Behavioral Modeling

Using logical and mathematical operators to describe what a circuit does rather than its physical structure.

- ##### Best Practices

Practical designs often combine both, using behavioral descriptions for leaf cells and structural for the hierarchy.

#### Sequential Logic in Verilog

- ##### The always block

The core construct for sequential logic. It executes statements based on a "sensitivity list".

- ##### Blocking vs Non-blocking assignments

    1. Blocking Assignment (=)
        Generally used for combinational logic within an always block

    2. Non-blocking Assignment (<=)
        Used for sequential logic (registers/flip-flops) to model concurrency

- ##### Flip-Flops & Latches

How to model positive-edge triggered registers and level-sensitive latches.

#### Finite State Machines

The lecture provides a step-by-step guide to implementing FSMs using three distinct blocks:

    1. State Register
        Using an always block with a clock to update the current state

    2. Next State Logic
        Using a case statement to determine the next state based on inputs

    3. Output Logic
        Assigning outputs based on the current state (Moore) or state plus inputs (Mealy)

#### Timing and Verification

- ##### Simulation and Synthesis

Delays (e.g., #5) are used for simulation testing but are ignored by synthesis tools for hardware.

- ##### Design Trade-off

An introduction to how area, speed, power, and design time influence hardware architecture