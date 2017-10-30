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

# References
1) Microsoft's ***PortQryV2.exe***, a command-line utility that you can use to help troubleshoot TCP/IP connectivity issues. 
	**Portqry.exe** runs on Windows 2000-based computers.
	https://www.microsoft.com/en-us/download/details.aspx?id=17148
2) Checking Port/Address connectivity Batch Script: https://stackoverflow.com/questions/29526342/windows-batch-script-to-see-if-a-sequence-of-server-ports-is-open
3) Checking Internet connectivity Batch Script: https://stackoverflow.com/questions/27589925/simple-batch-for-checking-internet-connectivity-and-setting-environment-variable
4) List all GPUs with Windows Batch Script: https://superuser.com/questions/723506/get-the-video-card-model-via-command-line-in-windows
