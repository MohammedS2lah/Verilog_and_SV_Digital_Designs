# Frame Check Sequence (FCS) Module

## Overview
This repository contains the implementation of a **Frame Check Sequence (FCS) module** using **Verilog**. 
The module is designed to compute a **16-bit CRC** for an incoming data stream (MHR) based on the **CRC-16** polynomial:

\[ G(x) = x^{16} + x^{12} + x^5 + 1 \]

The implementation follows a shift-register approach for serial data input and ensures correct computation of the **Frame Check Sequence (FCS)**. 
The design is verified through a testbench that compares the computed FCS against a pre-calculated CRC value.

## Features
- **Serial Data Input (LSB First)**
- **16-bit CRC Calculation**
- **Asynchronous Reset**
- **Validated FCS Output**
- **Designed for 32 MHz Clock System**

## Block interface

![image](https://github.com/user-attachments/assets/9f90c8e1-3230-4824-9c91-0f5a9706a315)


## Proposed Design

![image](https://github.com/user-attachments/assets/aeac2e4e-5b21-41c3-8ad5-915f2d07b8db)


![image](https://github.com/user-attachments/assets/91245ffb-6466-4648-9521-e02ff53d5f99)


## How It Works
1. The **data stream (MHR)** is shifted **LSB first** into the design via the `data` input.
2. The `start` signal remains **high** during transmission.
3. Once `start` is **deasserted**, the module holds the **computed CRC value** in `FCS_reg`.
4. The **valid signal** is asserted while shifting out the FCS.
5. The final FCS output is shifted serially through the `FCS` pin.

## Interface
|  Signal   | Direction | Width  |           Description             |
|-----------|-----------|--------|-----------------------------------|
| `clock`   |   Input   | 1-bit  | System clock (32 MHz)             |
| `reset_n` |   Input   | 1-bit  | Asynchronous active-low reset     |
| `data`    |   Input   | 1-bit  | Serial data input (LSB first)     |
| `start`   |   Input   | 1-bit  | High during data transmission     |
| `FCS`     |   Output  | 1-bit  | Serial output of FCS              |
| `valid`   |   Output  | 1-bit  | Indicates valid FCS being shifted |
| `FCS_reg` |   Output  | 16-bit | Holds the final computed FCS      |


## Simulation & Verification
### Tools Used:
- **Synopsys Spyglass**: RTL linting
- **Synopsys VCS**: Functional verification & simulation
- **Xilinx Vivado**: Synthesis & Schematic View

### Results:
- The computed **FCS matches** the expected CRC.
- The module correctly **shifts out the CRC** when `start` is deasserted.
- **Valid signal** behaves as expected during FCS output.


## Results from Spyglass after RTL linting

![image](https://github.com/user-attachments/assets/0788bb38-d6dd-4915-be3d-e1a2c80d14bd)

![image](https://github.com/user-attachments/assets/9d73f4d8-7542-4bec-bcf3-1befdc6beaea)


## Results from VCS after Simulation

![image](https://github.com/user-attachments/assets/85a4e7be-a76c-4d21-a004-e80920ba486f)


## VCS Log

![image](https://github.com/user-attachments/assets/3f5c6dfe-cf8a-45ae-8f96-9b8108ad5a9c)


## Design Schematic from Xilinx Vivado

![image](https://github.com/user-attachments/assets/73f03e67-144f-4b1f-985b-92cb9399caad)


## Conclusion
This **FCS module** implements a CRC-16 checksum for error detection in serial data transmission. 
The design is fully **verified** using **Synopsys & Xilinx EDA tools** and can be integrated into larger communication systems.
