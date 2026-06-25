# CMOS Schmitt Trigger Design and Characterization


This repository contains the design, simulation, and characterization of a **CMOS Schmitt Trigger**. The design flow involves schematic capture and netlist generation in **Synopsys Custom Compiler**, followed by full electrical characterization in **LTspice**.

## Table of Contents
* [Introduction](#introduction)
* [Circuit Design](#circuit-design)
* [Simulation Environment](#simulation-environment)
* [Characterization Results](#characterization-results)
* [Visual Verification](#visual-verification)
* [Log and Error Analysis](#log-and-error-analysis)
* [How to Reproduce](#how-to-run)
* [Author](#author)

---

## Introduction
A Schmitt Trigger is a dual-threshold comparator circuit that uses positive feedback to implement hysteresis. It is a fundamental building block in VLSI systems used for noise suppression, wave-shaping, and preventing multiple output transitions from slow or noisy input signals.

## Circuit Design
The design utilizes a standard 6-transistor CMOS configuration. The switching thresholds ($V_{TH+}$ and $V_{TH-}$) are determined by the ratio of the PMOS and NMOS device widths, specifically the feedback transistors.

* **Process Node:** Generic 105nm (Level 1 Models)
* **Supply Voltage ($V_{DD}$):** 1.05V
* **Transistor Sizes:** $W=0.1\mu m, L=0.03\mu m$



## Simulation Environment
The project was verified using **LTspice**. The raw netlist exported from Synopsys Custom Compiler was adapted to use generic Level 1 models to ensure tool interoperability and open-source accessibility.

### Tools Used
* **Design:** Synopsys Custom Compiler
* **Simulation:** LTspice XVII
* **Platform:** AlmaLinux (RHEL-based)

## Characterization Results
The circuit was characterized using a triangle wave input to observe both rising and falling transition points across the full supply range.

| Parameter | Value | Status |
| :--- | :--- | :--- |
| **$V_{TH+}$ (Rising Threshold)** | **~0.78 V** | Verified |
| **$V_{TH-}$ (Falling Threshold)** | **~0.47 V** | Verified |
| **$V_{H}$ (Hysteresis Width)** | **~0.31 V** | Calculated |
| **Average Power** | **~201.5 nW** | Verified |

## Visual Verification

### 1. Transient Waveform (Time Domain)
The transient analysis shows the output (`vout_final`) "snapping" high or low only after the input (`vin_sig`) crosses the defined thresholds. This confirms the time-domain stability of the design.
<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/0f92cc85-a804-4e57-9b56-338ef35b31ef" />



### 2. Hysteresis Loop (VTC)
The Voltage Transfer Characteristic (VTC) curve plotted as $V_{out}$ vs $V_{in}$ illustrates the distinct hysteresis window and noise margin.
<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/babc3982-7968-4250-a171-b2f18acfecaf" />



### 3. Circuit Symbol and Setup
| Logic Symbol | Simulation Testbench |
| :---: | :---: |
|<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/ef4b66da-1229-4585-988a-dcebfeb1ba5b" />
| <img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/f0015759-2c60-4b28-81c3-7a4db3c6e36f" />|

## Log and Error Analysis
The following numerical data was extracted from the Spice Error Log after transient analysis:

```text
vth_plus: v(vout_final)=0.525 AT 4.78357e-008
avg_power: AVG(i(v_vdd)*v(vdd!))=-2.01495e-007
```
> **Note**: Due to the **30nm channel length**, Level 1 MOSFET warnings were present in the log as the dimensions are below the legacy model's recommended limits. These were acknowledged and did not impact the functional verification.

<a name="how-to-run"></a>
## How to Run
1. **Clone the repository**: `git clone https://github.com/Harshitjoshi7/Schmitt-Trigger-Design.git`
2. **Open the testbench**: Open `tb/schmitt_tb.sp` in **LTspice**.
3. **Execute Simulation**: Click the **Run** (Running Man) icon.
4. **View Results**:
   * **Transient**: Plot `V(vin_sig)` and `V(vout_final)`.
   * **Hysteresis**: Right-click the X-axis of the plot and change the quantity from `time` to `V(vin_sig)`.
   * **Measurements**: Press **Ctrl + L** to see the power and threshold log.



<a name="author"></a>
## Author
* **Ayush Rajak**
