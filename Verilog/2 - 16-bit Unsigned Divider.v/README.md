# 16-bit Unsigned Divider in Verilog

## Overview
This project implements a **16-bit unsigned divider** in Verilog, designed to perform integer division using a sequential restoring division algorithm. 
The implementation supports:
- **Clocked operation** with sequential division.
- **Asynchronous reset** to initialize the system.
- **Start signal** to trigger the division process.
- **Error detection** for division by zero.
- **Output readiness flag** to indicate computation completion.

## Features
- **16-bit Dividend and Divisor**: Supports division of unsigned 16-bit integers.
- **Sequential Division**: Uses an iterative process to compute quotient and remainder.
- **Error Handling**: Detects division by zero and sets an error flag.
- **Synthesizable Design**: Compatible with ASIC/FPGA implementation.
- **Testbench Included**: A Verilog testbench is provided to verify functionality.

## Module Interface

### Inputs:
- **clock**: System clock signal.
- **reset_n**: Active-low asynchronous reset.
- **start_division**: Start signal to initiate division.
- **input_1**: 16-bit dividend.
- **input_2**: 16-bit divisor.

### Outputs:
- **output_Q**: 16-bit quotient.
- **remainder**: 16-bit remainder.
- **output_ready**: Indicates completion of division.
- **error**: Flag indicating division by zero.

## Implementation Details
The divider employs a **restoring division algorithm** that iteratively subtracts the divisor from the accumulator and shifts bits to compute the quotient. 
The main steps include:
1. **Initialization**: Load the dividend into an accumulator and store the divisor.
2. **Iteration**: For 16 cycles, perform subtraction and shift operations to derive the quotient and remainder.
3. **Completion**: Store the final quotient and remainder, set the `output_ready` flag.
4. **Error Handling**: If `input_2` is zero, set the `error` flag and halt computation.

## Simulation & Verification

### EDA Tools Used
- **Synopsys Spyglass**: Used for **RTL linting** to ensure coding guideline compliance.
- **Synopsys VCS**: Used for **functional simulation** and waveform analysis.
- **Xilinx Vivado**: Used for **synthesis and Gate-Level View**.

### Testbench
A **Verilog testbench** is provided to verify functionality. The testbench performs:
- **Basic Division Cases** (e.g., 100 / 5 = 20, remainder 0).
- **Edge Cases** (e.g., division by zero, zero dividend, divisor greater than dividend).
- **Corner Cases** (e.g., maximum values like 65535 / 256).

## Example Test Results
| Test Case | Dividend | Divisor | Quotient | Remainder | Error Flag |
|-----------|----------|--------|---------|----------|------------|
| 1        | 100      | 5      | 20      | 0        | 0          |
| 2        | 100      | 0      | -       | -        | 1          |
| 3        | 0        | 5      | 0       | 0        | 0          |
| 4        | 65535    | 256    | 255     | 255      | 0          |
| 5        | 10       | 20     | 0       | 10       | 0          |

## How to Run the Simulation
1. **Compile the Design** using Synopsys VCS:
   ```sh
   vcs -full64 unsi_divider_16bit.v unsi_divider_16bit_tb.v -o simv
   ./simv
   ```
2. **Analyze Waveforms** using Synopsys DVE:
   ```sh
   dve -full64 -vpd vcdplus.vpd &
   ```
3. **Synthesize with Vivado**:
   - Open Vivado and create a new project.
   - Add `unsi_divider_16bit.v` as the source file.
   - Run **Open Elaborated Design**.
   - Then View Schematic.

## Results from Spyglass after RTL linting

![image](https://github.com/user-attachments/assets/9fce8550-4191-453e-89e7-17a86decb030)

![image](https://github.com/user-attachments/assets/d8efa25c-f66c-490f-9c40-549542201da3)


## Results from VCS after Simulation

![image](https://github.com/user-attachments/assets/a094b367-7b7e-4648-90fa-894a14911b17)

![image](https://github.com/user-attachments/assets/c0f5d97a-53ff-4d97-84ef-b73da2333b30)


## VCS Log

![image](https://github.com/user-attachments/assets/e9bad427-dea3-41cc-9cb7-be3419ca096f)


## Design Schematic from Xilinx Vivado

![image](https://github.com/user-attachments/assets/3707718c-5f77-470a-b2e6-1b561910c2da)
