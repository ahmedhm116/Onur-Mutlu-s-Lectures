# Summary of Lecture#4

#### Introduction

This lecture of the course covers the final stages of sequential logic design and introduces the labs and Verilog (Hardware Description Language). The first half of the lecture is on the sequential part while the lab is introduced in the second half.

#### Sequential Logic and FSM's

- ##### Recap of Memory Elements

Mutlu reviews the difference between latches (level-triggered) and D Flip-flops (edge-triggered). He emphasizes that edge-triggered elements are preferred for FSMs to ensure state changes occur only at the clock edge

- ##### Moore vs Mealy Machine

    - ###### Moore Machine

        The output depends solely on the current state.

    - ###### Mealy Machine

        The output depends on both the current state and the inputs.

- ##### Smart Traffic Light 

The lecture walks through a practical example of a traffic light controller, showing how to move from a specification to a state transition diagram, a truth table, and finally to logic gates

- ##### State Encoding

Mutlu discusses different ways to represent states in binary.

    1. Fully Encoded
        Uses minimum possible number of bits.

    2. 1-Hot Encoded
        Each bit encodes a different state.

    3. Output Encoded
        Outputs are directly accessible in the state encoding.

All these have different trade-offs.

#### Intro to Lab

The rest of the lecture focuses on the introduction of the lab.

#### Intro to Verilog

The final portion of the lecture introduces the syntax and principles of Hardware Description Languages.

- ##### Why HDL?

Standard programming languages like C++ are sequential and cannot easily model the massive concurrency of hardware (billions of transistors operating at once).

- ##### Heirarchy

Hardware design uses a Top-Down or Bottom-Up approach, where complex systems are broken into "modules".

- ##### Basic Syntax

The lecture demonstrates how to define a module in Verilog, including port lists (inputs/outputs) and bit-width declarations.