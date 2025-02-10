# 2-to-1 Multiplexer Design and Testbench

This module implements a parameterized 2-to-1 multiplexer using SystemVerilog and includes a comprehensive testbench to verify its functionality.

## Module: `mux2to1`

### Description
The `mux2to1` module is a 2-to-1 multiplexer with a parameterized input width. It selects one of two input buses 
(`A` or `B`) based on the value of the select signal `S` and outputs the selected input to `Y`.

### Features
- **Parameterizable Width**: The default input width is 32 bits, but it can be adjusted using the parameter `N`.
- **Clean Design**: The module uses an `always_comb` block for combinational logic, ensuring efficient synthesis.

### Interface
#### Parameters:
- `N` (default: 32): Width of the input and output signals.

#### Ports:
- `A [N-1:0]` (Input): First data input.
- `B [N-1:0]` (Input): Second data input.
- `S` (Input): Select signal.  
  - `0`: Selects input `A`.
  - `1`: Selects input `B`.
- `Y [N-1:0]` (Output): Output of the multiplexer.

---

## Testbench: `mux2to1_tb`

### Description
The testbench verifies the functionality of the `mux2to1` module by simulating various input combinations and comparing the output against expected results.

### Features
- **Parameterized Width**: Matches the design width for flexibility.
- **Thorough Testing**: Covers multiple test cases for different input values and select signals.
- **Compact DUT Instantiation**: Uses SystemVerilog's `.*` syntax for clarity.

### Key Test Cases
1. **Select A**: `S = 0` ensures the output matches `A`.
2. **Select B**: `S = 1` ensures the output matches `B`.
3. **Edge Cases**: Different input values to test robustness.


## EDA (Simulation) Tools used: ModelSim and Vivado

## ModelSim Part:

### Result of Compilation

![image](https://github.com/user-attachments/assets/084d4093-8839-4689-ad57-706b619cb23d)

### Results of Simulation

![image](https://github.com/user-attachments/assets/9b316b0b-53a4-4a46-b55b-980f0f12bf5c)

![image](https://github.com/user-attachments/assets/bbb95709-e32f-4887-844b-c65977b67116)


## Vivado Part:

### Design Schematic

![image](https://github.com/user-attachments/assets/3b5eba16-4d46-483e-bc9a-19f6d3d3ce44)
