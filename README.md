# Verilog Key Debounce Module
## Basic Description
This code is a Verilog key debounce module, used for mechanical button debounce in FPGA development.
## Module Description
### Port Information
This module contains 3 input ports and 1 output ports. The port definitions are as follows:
#### Input Ports:
* `clk`: 1-bit wide clock signal, default at 50MHz.
* `rst_n`: 1-bit wide reset signal, active low.
* `key_input`: 1-bit wide raw key input signal.
#### Output Ports:
* `key_filter`: 1-bit wide, filtered key signal after debounce.
### Configurable Parameters
* `DELAY_TIME`: delay time of key debounce, measured by the period number of `clk` signal. The default delay time is 
  20ms at 50MHz `clk` signal. The frequency of key signal change should not exceed that of delay time. Check the widths 
  of related registers after adjustment.\
  *related register:* `cnt`
* `DEFAULT_OUTPUT`: output just after reset.
------------------------------------------------------------------------------------------------------------------------
## 基本描述
Verilog按键消抖模块，用于FPGA开发中的按键去抖操作。
## 模块描述
### 端口信息
该模块包含3个输入端口和1个输出端口，各端口的定义如下：
#### 输入端口：
* `clk`: 位宽为1位，时钟信号，默认为50MHz。
* `rst_n`: 位宽为1位，复位信号，低有效。
* `key_input`: 位宽为1位，原始按键输入信号。
#### 输出端口：
* `key_filter`: 位宽为1位，消抖后的按键信号。
### 可修改参数信息
* `DELAY_TIME`: 消抖过程中的延迟时间，以包含的`clk`时钟信号的周期数计。在`clk`时钟信号的频率为50MHz的情况下，默认的延迟时间为20ms
  。按键信号的变化频率不应超过延迟时间对应的频率。更改后应检查相关寄存器的位宽。\
  *相关寄存器：* `cnt`
* `DEFAULT_OUTPUT`: 刚复位后模块的输出。
