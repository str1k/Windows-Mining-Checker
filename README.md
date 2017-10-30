# Windows-Mining-Checker


# Usage
1) Check internet activity of the computer for 10 tries, 
if the connection could not be estrablished to www.google.com the script will restart PC
2) Check connection with mining pool address list, 
if the connection could not be estrablished to any of the address the script will restart PC
3) Check number of active GPUs,
if the number of active GPUs is less than the number of configured value the script will restart PC
4) If all the condition pass the script will execute miner script

# Installation
1) Copy all files to miner directory

# Configuration
**Use notepad to edit checker.bat file**
1) GPU_NUM : number of graphic card install on your system
2) RESTART_TIME : time in second untill the script will restart PC
3) servers : list of pool mining address (provide only addres and port without stratum+tcp)
4) EXECUTE_FILE : name of the script that this script will run
5) ONBOARD_GPU : Set to 1 if you have onboard GPU, set to 0 if you dont have one

# About
Windows Batch script check connectivity of computer with internet access.
Windows Batch script list all GPUs in the computer.
Windows Batch script check connectivity to specific port / adress.
