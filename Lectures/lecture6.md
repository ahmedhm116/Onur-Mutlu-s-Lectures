# Summary of Lecture#6

#### Introduction

The lecture covers the transition from idealized digital logic to the complexities of real-world implementation.

#### Combinational Circuit Timing

The lecture explains that in reality, outputs do not change immediately with inputs due to transistor switching times, resistance, and capacitance.

- ##### Propagation Delay (tpd)

The maximum time from an input change until the output finishes changing (reaches a stable state).

- ##### Contamination Delay (tcd)

The minimum time from an input change until the output starts to change.

- ##### Glitches

Occur when an input transition causes multiple output transitions before settling, often due to different paths (slow vs. fast) leading to the same output.

#### Sequential Circuit Timing

The instructor emphasizes that data must be stable during a specific window around the active clock edge to be sampled correctly.

- ##### Setup Time (tsetup)

Time before the clock edge that data must be stable.

- ##### Hold Time (thold)

Time after the clock edge that data must be stable.

- ##### Metastability

If these times are violated, the flip-flop might enter a metastable state where the output is neither 0 nor 1, leading to non-deterministic behavior.

- ##### Propagation Delay (tpcq)

The maximum time from an input change until the output finishes changing (reaches a stable state).

- ##### Contamination Delay (tccd)

The minimum time from an input change until the output starts to change.

#### Timing Constraints and Clock Skew

- ##### Setup Constraint

Determines the minimum clock period (maximum frequency). If the logic is too slow, the clock period must be increased to avoid errors.

- ##### Hold Constraint

Ensures that data doesn't change too quickly and "race" through to the next flip-flop. Interestingly, hold time violations cannot be fixed by slowing down the clock.

- ##### Clock Skew (tskew)

The difference in arrival times of the clock signal at different parts of the chip. This effectively increases the required setup and hold times, reducing the "useful work" window.

#### Functional & Timing Verification

The lecture discusses how designers ensure a circuit works as intended, noting that verification can take up to 70% of total design time.

- ##### Test Benches

Modules created to test a "Device Under Test" (DUT).

    1. Simple Test Benches
        Inout/Output Generation: Manual
        Error Checking: Manual

    2. Self-Checking Test Benches
        Inout/Output Generation: Manual
        Error Checking: Automatic

    3. Automatic Test Benches
        Inout/Output Generation: Automatic
        Error Checking: Automatic

- ##### Timing Reports

Tools (like Vivado) generate reports to identify "critical paths" that fail to meet timing.

- ##### Fixing Time Errors

Strategies include simplifying logic, splitting long paths with registers (pipelining), or adding buffers to fix hold time violations.

This lecture concludes the digital design part of the course.