# Absolute Subtraction of Signed 4-bit Numbers

## Overview
This project implements an absolute subtraction operation for two signed 4-bit numbers using Verilog. 
The design ensures that the output is always the absolute difference between the two input values, regardless of their relative magnitudes.

## Problem Statement
The goal is to compute the absolute value of the difference between two 4-bit signed numbers (A and B). 
Since the inputs are signed, the subtraction result may be negative. The design ensures the output is always positive.

## Design Approach
1. **Subtraction Operation:** Compute `A - B`.
2. **Sign Detection:** If the result is negative, compute `B - A` instead.
3. **Absolute Value Handling:** Assign the correct value based on the sign bit.

## Key Features
- Supports signed 4-bit numbers (-8 to +7 range).
- Uses combinational logic for efficient computation.
- Implements conditional logic to determine absolute value.
- Designed to be synthesis-friendly and resource-efficient.

## Tools Used
- **Synopsys Spyglass**: RTL linting.
- **Synopsys VCS**: Simulation and verification.
- **Xilinx Vivado**: Synthesis and schematic visualization.

## Verification Strategy
- The design was tested with multiple scenarios to validate correctness:
  - Positive values (e.g., `|5 - 3| = 2`)
  - Negative values (e.g., `|-4 - (-2)| = 2`)
  - Cross-boundary values (e.g., `|7 - (-1)| = 8`)
- Waveform analysis and behavioral simulation confirmed correct functionality.

## Results from Spyglass after RTL linting

![image](https://github.com/user-attachments/assets/718d3ce5-1efe-44e8-97fc-d7378108f553)

![image](https://github.com/user-attachments/assets/962cf1b3-dd42-4f17-9f2b-b48fb8cf2ce6)


## Results from VCS after Simulation

![image](https://github.com/user-attachments/assets/1e2e1bb5-614b-41f4-b8c6-1bbe5b6cce72)


## VCS Log

![image](https://github.com/user-attachments/assets/3c22fbc2-b5ae-4144-9608-2ffe06230c2b)


## Design Schematic from Xilinx Vivado

![image](https://github.com/user-attachments/assets/f08bbced-1ea9-470a-9728-d9c4fd96d9bc)


## Conclusion
This implementation provides a simple yet efficient method for computing absolute subtraction of signed 4-bit numbers. 
The design is validated, synthesis-ready, and can be integrated into larger digital systems requiring signed arithmetic operations.

