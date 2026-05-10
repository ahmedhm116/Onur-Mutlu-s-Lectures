# Summary of Lecture #1

#### Introduction

Professor Mutlu begins by defining the scope of the course, understanding how modern computers work and how they are built from scratch. The lecture is divided into main parts. First is the introduction to the course and second is the dive into the basic building blocks, i.e transistors and logic gates.

#### Transformation Heirarchy

Transformation Hierarchy explains how a high-level problem is translated into electron level, which really tells us how the algorithm or the architecture actually works.

- ##### The Stack

    - Problem
    - Algorithm
    - Program
    - System Software
    - ISA (Instruction Set Architecture)
    - Microarchitecture
    - Logic
    - Circuits 
    - Electrons

- ##### Expanded View

    Usually, architecture is thought of only as ISA and Microarchitecture. Mutlu describes where we design across the stack to achieve maximum efficiency.

#### Golden Age Of Architecture

Mutlu Says that today is the **"Golden Age"** to learn architecture.

##### The Reason

He says that we have moved past simple CPU's. Modern chips are incredibly complex, containing various accelerators for AI, video editing and other stuff. He says that there is massive room for improvement at the the top as well as the bottom of the heirarchy.

#### Fundamentals: The Transistor

Abstracting the electron level, he talks about the basic of every microarchitecture, i.e The Transistor specifically the **MOS** transistor (Metal-Oxide-Semiconductor).

##### Transistor as A Switch

Rather than a complex structure, the lecture treats the transistor as switch much like a wall switch in our house.

- ##### N-mos 

    - closed when logic high is applied
    - good at pulling down

- ##### P-mos 

    - closed when logic low is applied
    - good at pulling up

- ##### C-mos

    Modern computers use C-mos technology which is a combination of both nmos and pmos. The design ensures that the circuit only consumes significant power when switching states.

#### Building Logic Gates

Using nmos and pmos, Mutlu demonstrates how to construct basic logic gates.

##### NOT Gate

- ##### Construction

    Uses one pmos(top) and one nmos(bottom)

- ##### Logic

    If input is high, nmos turns ON pulling the output to 0. If the input is low, pmos turns ON, pulling the output to 1.

##### NAND Gate

This is the universal gate meaning that every logic fundtion can be constructed using only NAND gates.

- ##### Construction

    Two pmos in parallel and two nmos in series.

- ##### Logic

    The output is 0 only if both inputs are 1. In all other cases, at least one of the pmos is ON keeping output at 1.

##### AND Gate

In cmos technology, AND gate is more expensive as we have to connect a NAND gate and then invert the output to flip the signal back.

#### Conclusion

This lecture mostly consists of the introduction to the course so Mutlu tells about the objectives, labs, study material and the staff and then starts the lecture with transistors and logic gates.