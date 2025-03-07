# 8-bit Serializer

This module implements an 8-bit Serializer, which converts parallel data into a serial bit stream for efficient data transmission. 
The design is implemented in Verilog and verified using industry-standard EDA tools.

## Overview
A serializer is a fundamental component in digital communication systems, enabling parallel-to-serial data conversion. 
This 8-bit serializer takes an 8-bit input and transmits the data sequentially over 8 clock cycles.

## Features
- 8-bit parallel data input
- Serial data output
- Control signal to initiate serialization
- Synchronous reset
- Designed for FPGA and ASIC implementations

## Interface
### **Inputs:**
- `clock_in` : System clock.
- `clock_out` : Control signal to initiate serialization.
- `reset_n` : Active-low reset.
- `din[7:0]` : 8-bit parallel data input.

### **Output:**
- `dout` : Serialized 1-bit output.

## Functionality
1. **Loading Data:** When `clock_out` is asserted, the 8-bit input `din` is loaded into an internal shift register.
2. **Serialization:** On each rising edge of `clock_in`, the least significant bit (LSB) of the register is shifted out to `dout`.
3. **Completion:** The module continues shifting bits out sequentially until all 8 bits are transmitted.
4. **Reset Behavior:** When `reset_n` is deasserted, the serializer clears its internal registers.

## Testbench
The serializer is tested using multiple scenarios:
1. Serializing `din = 8'b10101010`.
2. Serializing `din = 8'b11110000`.
3. Resetting during serialization.
4. Handling different data inputs.

## Results from Spyglass after RTL linting

![image](https://github.com/user-attachments/assets/0896bbf2-5231-4ca6-a238-b82b380828bd)

![image](https://github.com/user-attachments/assets/25928d45-c78c-45b8-a6d6-6d60bdd48265)


## Results from VCS after Simulation

![image](https://github.com/user-attachments/assets/cd086657-d393-4cd1-8234-98e6c3c5e004)

![image](https://github.com/user-attachments/assets/67ad8a62-2713-401f-89b1-160d3bd32de9)


## VCS Log

![image](https://github.com/user-attachments/assets/289b89c9-0c01-425a-801c-d894bd2ee703)


## Design Schematic from Xilinx Vivado

![image](https://github.com/user-attachments/assets/6cd62dfd-246f-46d7-80ea-e9708e94e211)

