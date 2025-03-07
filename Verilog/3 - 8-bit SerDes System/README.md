# 8-bit SerDes (Serializer/Deserializer) System

This repository contains a complete Verilog implementation of an 8-bit Serializer and Deserializer (SerDes), 
along with their respective testbenches. The design is verified using industry-standard EDA tools.

## Project Overview
SerDes is an essential component in high-speed digital communication systems, enabling efficient data transmission 
by converting parallel data to a serial stream and vice versa.

### **Top-Level Design**
The SerDes system consists of two main modules:
1. **Serializer**: Converts an 8-bit parallel input into a serial bit stream.
2. **Deserializer**: Reconstructs the original 8-bit data from the serialized bit stream.


![image](https://github.com/user-attachments/assets/c5227a94-4a2a-4cfb-84d3-ea227aab134a)


## Serializer
The serializer takes an 8-bit input and transmits it serially over 8 clock cycles.

### **Inputs:**
- `clock_in` : System clock.
- `clock_out` : Control signal to initiate serialization.
- `reset_n` : Active-low reset.
- `din[7:0]` : 8-bit parallel data input.

### **Output:**
- `dout` : Serialized 1-bit output.

## Deserializer
The deserializer reconstructs the original 8-bit data from the serialized stream.

### **Inputs:**
- `clock_in` : System clock.
- `reset_n` : Active-low reset.
- `din` : 1-bit serialized data input.

### **Outputs:**
- `dout[7:0]` : 8-bit parallel data output.
- `clock_out` : Control signal indicating valid data output.

## Implementation Details
### **Serializer Module**
- Stores input data when `clock_out` is asserted.
- Uses a shift register to transmit bits sequentially.
- A counter tracks the number of bits transmitted.
- Reset ensures proper initialization of the shift register and counter.

### **Deserializer Module**
- Receives serial bits and assembles them into an 8-bit word.
- Uses a shift register and a counter to track the received bits.
- Generates `clock_out` to indicate when valid data is available.


## Tools Used
- **RTL Linting:** Synopsys SpyGlass
- **Simulation & Verification:** Synopsys VCS
- **Synthesis & Schematic View:** Xilinx Vivado

