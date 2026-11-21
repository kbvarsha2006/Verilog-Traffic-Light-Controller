# Traffic Light Controller Using Verilog

## Project Overview
A four-state Finite State Machine (FSM) designed using Verilog to control traffic lights at a two-road intersection.

## Traffic Light States

| State | North-South | East-West |
|---|---|---|
| S0 | Green | Red |
| S1 | Yellow | Red |
| S2 | Red | Green |
| S3 | Red | Yellow |

The FSM continuously cycles through all four states using a clock signal. An active-high reset initializes the controller to S0.

## Tools Used
- Verilog HDL
- Icarus Verilog
- Yosys
- GTKWave

## Project Files
- `traffic_light_controller.v` – Main Verilog design
- `tb_traffic_light.v` – Testbench
- `traffic_light.vcd` – Simulation waveform
- `traffic_light_waveform.png` – Waveform screenshot
- `traffic_light_synth.v` – Synthesized Verilog netlist

## Simulation

Compile:

```bash
iverilog -o traffic_light_tb.vvp traffic_light_controller.v tb_traffic_light.v
```

Run:

```bash
vvp traffic_light_tb.vvp
```

View waveform:

```bash
gtkwave traffic_light.vcd
```

## Synthesis

```bash
yosys -p "read_verilog traffic_light_controller.v; hierarchy -top traffic_light_controller; proc; opt; check; synth -top traffic_light_controller; stat; write_verilog traffic_light_synth.v"
```

## Result
The design successfully completes simulation of all four traffic light states and passes Yosys synthesis checks.# Verilog-Based Traffic Light Controller

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
