# Traffic Light Controller Using Verilog

## Project Overview
This project implements a traffic light controller using Verilog HDL. It controls traffic signals for two roads: North-South and East-West, using a Finite State Machine (FSM).

## Objectives
- To design a traffic light controller using Verilog.
- To understand Finite State Machines (FSM).
- To simulate traffic signal operations.
- To synthesize the Verilog design using Yosys.

## Software Tools Used
- Visual Studio Code
- Icarus Verilog
- Yosys
- GTKWave (optional waveform viewer)

## Traffic Light Sequence
1. North-South Green, East-West Red.
2. North-South Yellow, East-West Red.
3. North-South Red, East-West Green.
4. North-South Red, East-West Yellow.

## Simulation
The design was simulated using Icarus Verilog. The simulation output was successfully verified, and a VCD waveform file was generated.

## Synthesis
The Verilog design was successfully synthesized using Yosys. The synthesis process detected the FSM and completed with zero reported problems.

## Project Files
- `traffic_light.v` – Main Verilog design.
- `traffic_light_tb.v` – Testbench.
- `traffic_light.vcd` – Simulation waveform.
- `traffic_light_synth.v` – Synthesized Verilog output.

## Conclusion
The traffic light controller was successfully designed, simulated, and synthesized using Verilog HDL, Icarus Verilog, and Yosys.
