# Summary of Lecture#2

#### Introduction

The second lecture of the course focuses on combinational logic. It describes the relation between the logic gates and framework of boolean algebra. Professor Mutlu also talks about some basic building blocksof combinational logic.
He starts the lecture with an overview of the last lecture and where he left off.

#### CMOS Structure

As discussed in the last lecture, the cmos consists of a pull up network and a pull down network. At a given time, only one of this network should be ON so no short circuit occurs. MOS transistors are imperfect switches so this structure is used if used vice versa the logic will not be pulled up or down to the required value.

#### Power Consumption

- ##### Dynamic Power

    consumed during switching (C*Vsquared*f)

- ##### Static Power

    Consumed due to leakage even when the circuit is idle (V*Ileakage)

#### Moore's Law

Moore's Law states that "*The number of transistors on microchips doubles every two years*"
This advancement is important as other aspects of technology improve such processing power and cost electronic products are related to Moore's Law.

#### Combinational Logic

- has no memory
- output is stictly dependent on the current values of the input

#### Boolean Algebra and Logic Minimization

Logic gates are represented by using boolean algebra. They help us to understand the working and the structure of the circuit. we can minimize the circuit by using laws and axioms of boolean algebra which lowers cost, area and latency.

- ##### Canonical Form

    The minimization is done by using sum of products or products of sum form.

    - ##### SOP Form

        OR-ing together "Min-terms" (input combinations that result in 1)

    - ##### POS Form

        AND-ing together "Max-terms" (input combinations that result in 0)

- ##### Bubble Pushing

A technique using De-Morgan's law to transform gate types to optimize specific harware constraints.

#### Essential Combinational Blocks

- ##### Decoders

Detects specific input patterns. for *n* inputs, it has *2 power n* outputs out of which only one is high at a given time. Common example is 2-4 decoder.

- ##### Multiplexers

Act as selectors that pass one of several data inputs to the output based on a select signal. Common examples are 2-1 MUX and 4-1 MUX

- ##### Lookup Tables

Multiplexers can be used as LUT's to implement any logic function which is foundational principle behind FPGA's.

- ##### Adders

The lecture explains a Full Adder with three inputs (A, B, C_in) and two outputs (Y, C_out) and how they are chained to create a **Ripple Carry Adder** or accelerated via **Carry Lookahead Adders**.

All these blocks can be used on their own to implement a logic.

#### Programmable Logic Arrays (PLA)

A PLA is a flexible hardware structure with a programmable "AND" array followed by a programmable "OR" array. It allows any logic function to be implemented in a standardized SOP Form by simply programming the connections.