@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Dec 04 15:25:53 +0100 2019
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim control_matr_mult_tb_behav -key {Behavioral:control_matr_mult_tb:Functional:control_matr_mult_tb} -tclbatch control_matr_mult_tb.tcl -log simulate.log"
call xsim  control_matr_mult_tb_behav -key {Behavioral:control_matr_mult_tb:Functional:control_matr_mult_tb} -tclbatch control_matr_mult_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
