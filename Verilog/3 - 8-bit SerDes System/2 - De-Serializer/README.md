# 8-bit De-Serializer

This module implements an 8-bit De-Serializer, which reconstructs parallel data from a serial bit stream. 
It is a critical component in communication and data transmission systems where serialized data needs to be converted back into parallel form.

## Overview
A de-serializer receives a stream of serialized data and reconstructs it into an 8-bit parallel output. 
The design ensures proper synchronization and includes a control signal (`clock_out`) to indicate when valid parallel data is available.

## Features
- 8-bit serial-to-parallel conversion
- Serial input data reception
- Internal shift register for bit accumulation
- `clock_out` signal to indicate valid output data
- Synchronous reset functionality

## Interface
### **Inputs:**
- `clock_in` : System clock.
- `reset_n` : Active-low reset.
- `din` : Serial data input.

### **Outputs:**
- `dout[7:0]` : Reconstructed parallel 8-bit output.
- `clock_out` : Control signal indicating valid data availability.

## Functionality
1. **Serial Data Reception:** Incoming serial data (`din`) is shifted into an internal register on every clock cycle.
2. **Data Reconstruction:** Once 8 bits are received, the data is transferred to `dout`, and `clock_out` is asserted to indicate completion.
3. **Reset Behavior:** When `reset_n` is deasserted, all registers and counters are reset to ensure a fresh start.

## Testbench
The de-serializer is tested under various conditions:
1. Deserializing `din = 8'b11010101`.
2. Deserializing `din = 8'b10101010`.
3. Deserializing `din = 8'b11110000`.
4. Resetting during deserialization to verify proper initialization.

## Tools Used
- **RTL Linting:** Synopsys SpyGlass
- **Simulation & Verification:** Synopsys VCS
- **Synthesis & Schematic View:** Xilinx Vivado

## Results from Spyglass after RTL linting

![image](https://github.com/user-attachments/assets/6e1af761-f0f0-4fcb-a2d4-4beebd5af96f)

![image](https://github.com/user-attachments/assets/fb6096b8-ff2c-4056-83b5-2dd7b1c9acc2)


## Results from VCS after Simulation

![image](https://github.com/user-attachments/assets/4934e32f-ee3d-4a46-8cc5-c06f1351d483)


## VCS Log

![image](https://github.com/user-attachments/assets/4eac96a5-c8d6-4142-bfaa-2e2faccaac7e)


## Design Schematic from Xilinx Vivado

![image](https://github.com/user-attachments/assets/640b0739-cc0a-4b13-a552-6943b7a57163)
