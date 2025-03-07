# Garage System

## Overview
The Garage System is a Verilog-based hardware module designed to manage the entry and exit of cars in a parking garage. 
It ensures that vehicles can enter and exit based on available space while preventing over-occupancy. 
The system operates synchronously with a clock signal and features a reset functionality.

## Features
- Controlled car entry and exit mechanism.
- Prevents overfilling by restricting entry when the garage is full.
- Keeps track of the number of cars inside the garage.
- Provides door control signals for entry and exit.

## Module Interface

### Inputs
- **clock**: System clock to synchronize operations.
- **reset_n**: Active-low reset signal to initialize the system.
- **car_entry_request**: Signal indicating a car is requesting entry.
- **car_exit_request**: Signal indicating a car is requesting exit.

### Outputs
- **open_entry_door**: Signal to open the entry door when conditions allow.
- **open_exit_door**: Signal to open the exit door when conditions allow.
- **garage_is_complete**: Signal indicating that the garage has reached full capacity.

## Operation
1. When a **car_entry_request** is received, the system checks if the garage is full. If not, it increments the counter and opens the entry door.
2. When a **car_exit_request** is received, the system checks if there are any cars inside. If yes, it decrements the counter and opens the exit door.
3. If the garage reaches full capacity, no further cars are allowed to enter.
4. If the garage is empty, no cars can exit (The exit door won't open).
5. The system can be reset using the **reset_n** signal, returning all states to the initial values.

## Simulation and Verification
The Garage System was tested using a structured testbench that validates the following scenarios:
- Single and multiple car entries.
- Single and multiple car exits.
- Attempted entry when the garage is full.
- Attempted exit when the garage is empty.
- System reset functionality.

## Tools Used
- **Synopsys Spyglass** for RTL linting.
- **Synopsys VCS** for simulation and verification.
- **Xilinx Vivado** for synthesis and schematic View.


## Results from Spyglass after RTL linting

![image](https://github.com/user-attachments/assets/8c31dabb-33d7-4f27-8330-c1f5220ed74d)

![image](https://github.com/user-attachments/assets/9ef3c848-fb79-4a68-afc9-b8b23cde8aa9)


## Results from VCS after Simulation

![image](https://github.com/user-attachments/assets/a2ab0081-d6f7-412e-a203-554e97549afd)

![image](https://github.com/user-attachments/assets/2d189cb0-f555-4084-b4b0-59835fa521ae)


## VCS Log

![image](https://github.com/user-attachments/assets/a80ae4e4-e553-4163-96eb-8ced641c9def)
![image](https://github.com/user-attachments/assets/30b037c8-b1c4-4590-87bb-7d8c75718927)
![image](https://github.com/user-attachments/assets/73a59b17-c118-44e2-9f34-360b329dc1ef)
![image](https://github.com/user-attachments/assets/91a18f9c-b1e8-4814-ad0e-13b856c8dda5)
![image](https://github.com/user-attachments/assets/218a762c-58d1-45f1-8a89-1af8ddec5746)


## Design Schematic from Xilinx Vivado

![image](https://github.com/user-attachments/assets/de479a14-03f5-4eb0-b8c8-40adba35057b)

