# 4-to-1 Multiplexer Design and Testbench

This module implements a parameterized 4-to-1 multiplexer using SystemVerilog, constructed hierarchically with instances of 2-to-1 multiplexers. 
It includes a comprehensive testbench to verify its functionality.

## Module: `mux4to1`

### Description
The `mux4to1` module is a 4-to-1 multiplexer with a parameterized input width. It selects one of four input buses 
(`A`, `B`, `C`, or `D`) based on the 2-bit select signal `S` and outputs the selected input to `Y`. 
The design utilizes three instances of the `mux2to1` module to implement the multiplexer in a hierarchical manner.

### Features
- **Parameterizable Width**: The default input width is 32 bits, adjustable using the parameter `N`.
- **Hierarchical Design**: Built using multiple instances of the `mux2to1` module for modularity and reusability.

### Interface
#### Parameters:
- `N` (default: 32): Width of the input and output signals.

#### Ports:
- `A [N-1:0]` (Input): First data input.
- `B [N-1:0]` (Input): Second data input.
- `C [N-1:0]` (Input): Third data input.
- `D [N-1:0]` (Input): Fourth data input.
- `S [1:0]` (Input): 2-bit select signal.  
  - `00`: Selects input `A`.
  - `01`: Selects input `B`.
  - `10`: Selects input `C`.
  - `11`: Selects input `D`.
- `Y [N-1:0]` (Output): Output of the multiplexer.

---

## Testbench: `mux4to1_tb`

### Description
The testbench verifies the functionality of the `mux4to1` module by simulating various input combinations and comparing the output against expected results. 
It tests all possible select signal (`S`) values to ensure the correct input is routed to the output.

### Features
- **Parameterized Width**: Matches the design width for flexibility.
- **Comprehensive Testing**: Covers all four possible input selections.

### Key Test Cases
1. **Select A**: `S = 00` ensures the output matches `A`.
2. **Select B**: `S = 01` ensures the output matches `B`.
3. **Select C**: `S = 10` ensures the output matches `C`.
4. **Select D**: `S = 11` ensures the output matches `D`.

---

## EDA (Simulation) Tools used: ModelSim and Vivado

## ModelSim Part:

### Result of Compilation

![image](https://github.com/user-attachments/assets/625a2153-d344-4163-8b26-8b59361edf50)

### Results of Simulation

![image](https://github.com/user-attachments/assets/e0768416-8484-4af5-aaf0-c0c94615f7a4)

![image](https://github.com/user-attachments/assets/0633b87f-adb6-4c7d-8620-ba450f1dad15)

## Vivado Part:

### Design Schematic

![image](https://github.com/user-attachments/assets/3c422259-5990-4e90-85a9-1973cd9328b7)


![image](https://github.com/user-attachments/assets/77925bc8-1d80-4a2e-8fe8-a9b55e8bb81f)

