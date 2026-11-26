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
The design successfully passes all six automated testbench checks, covering all four traffic light states, state cycling, and reset operation. Yosys synthesis completes successfully.
