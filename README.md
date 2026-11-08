# Verilog-Based Traffic Light Controller

## Project Description
This project implements a traffic light controller using Verilog HDL and a Finite State Machine (FSM). It controls traffic signals for two roads: North-South and East-West.

## Objectives
- To design a traffic light controller using Verilog.
- To understand Finite State Machines (FSM).
- To simulate traffic signal operations.
- To perform logic synthesis using Yosys.

## Software Tools Used
- Visual Studio Code
- Icarus Verilog
- GTKWave
- Yosys

## Traffic Light Sequence
1. North-South Green, East-West Red.
2. North-South Yellow, East-West Red.
3. North-South Red, East-West Green.
4. North-South Red, East-West Yellow.

## Simulation
The design was simulated using Icarus Verilog. The generated VCD waveform was opened and verified using GTKWave.

## Synthesis
The Verilog design was synthesized using Yosys 0.66. The synthesized Verilog output is saved as `traffic_light_synth.v`.

## Project Files
- `traffic_light.v` – Main Verilog design.
- `traffic_light_tb.v` – Testbench.
- `traffic_light.vcd` – Simulation waveform.
- `traffic_light_sim` – Compiled simulation output.
- `traffic_light_synth.v` – Synthesized Verilog design.
- `traffic_light_waveform.png` – Waveform screenshot.

## Conclusion
The traffic light controller was successfully designed using Verilog HDL, simulated using Icarus Verilog, visualized using GTKWave, and synthesized using Yosys.
