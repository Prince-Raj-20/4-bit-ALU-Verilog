# 4-bit-ALU-Verilog

# 🔢 4-bit ALU in Verilog – Simulation Project

This project implements a 4-bit **Arithmetic Logic Unit (ALU)** using **Verilog HDL**, a key component in digital processors. The ALU is designed to perform basic arithmetic and logic operations and simulate the behavior of a real CPU-level ALU by including condition flags such as **Zero**, **Negative**, and **CarryOut**.

It is fully simulated using open-source tools: **Icarus Verilog** for compilation and simulation, and **GTKWave** for waveform visualization.

---

## 🎯 Project Objective

To understand and demonstrate:
- Register-transfer level (***RTL***) design using Verilog
- ALU operations and internal logic
- Use of simulation tools like Icarus Verilog and GTKWave
- How condition flags (Zero, Negative, Carry) are implemented in hardware logic
- Writing and debugging a Verilog ***testbench***

---

## 🧠 What the ALU Does

The ALU supports the following 4-bit operations based on a **4-bit control input (`ALU_Sel`)**:

| Opcode | Operation        | Description                         |
|--------|------------------|-------------------------------------|
| 0000   | AND              | Bitwise AND                         |
| 0001   | OR               | Bitwise OR                          |
| 0010   | ADD              | 4-bit addition with carry output    |
| 0110   | SUB              | 4-bit subtraction with carry output |
| 0111   | SLT              | Set output to 1 if A < B            |
| 1100   | NOR              | Bitwise NOR                         |

### Output Flags
- **CarryOut**: High if there’s a carry during addition/subtraction
- **Zero**: High if result is 0
- **Negative**: High if MSB of output is 1 (i.e., result is negative in signed logic)

---

## 🛠 File Overview

```
4-bit-ALU-Verilog/
├── 4bit_alu.v     # Main ALU module (with condition flags)
├── 4bit_alu_tb.v  # Testbench for simulating ALU behavior
├── alu_flags.vcd  # Waveform output (auto-generated on run)
└── README.md      # Project description, usage instructions, and simulation steps

```

---

## ▶️ How to Run the Simulation

### Requirements:
- [Icarus Verilog](http://iverilog.icarus.com/)
- [GTKWave](http://gtkwave.sourceforge.net/)

### 🔧 Steps:

1. **Compile the ALU and testbench:**
```
   iverilog -o alu_test 4bit_alu.v 4bit_alu_tb.v
```
2. **Run the simulation:**
```
   vvp alu_test
```
3. **View the waveform:**
```
   gtkwave alu_flags.vcd
```

---

### 👨‍💻 Author
```
Prince Raj
GitHub: Prince-Raj-20
```
---

