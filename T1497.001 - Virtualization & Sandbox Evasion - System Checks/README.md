# T1497.001 - Virtualization/Sandbox Evasion - System Checks

Adversaries may employ various means to detect and avoid virtualization and analysis environments. This may include changing behaviors based on the results of checks for the presence of artifacts indicative of a virtual machine environment (VME) or sandbox. If the adversary detects a VME, they may alter their malware to disengage from the victim or conceal the core functions of the implant. They may also search for VME artifacts before dropping secondary or additional payloads. Adversaries may use the information learned from Virtualization/Sandbox Evasion during automated discovery to shape follow-on behaviors.

This process is performed in memory, via the module [ubash](https://github.com/scythe-io/community-modules/blob/main/ubash/linux/bin/package.zip) from our [Community-Modules Repo](https://github.com/scythe-io/community-modules)


## Import the Compound Action into SCYTHE

1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threats" click "Choose File" and select the JOSN file you downloaded from GitHub.
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon

## Installing VFS Files
1. From the SCYTHE GUI, click Virtual File System.
2. Navigate to the root folder `VFS:/`, and click on the `shared` folder. 
3. If the `utils` directory does not exist, click `New Folder ...` and create a `utils` folder. 
4. Place the shell script `container_check.sh` under the `VFS` folder you downloaded from Github under this directory. 


## Installing Community Module 

To Install a community module, please follow the instructions on this [Wiki](https://github.com/scythe-io/community-modules/wiki).
You will want to install [ubash](https://github.com/scythe-io/community-modules/blob/main/ubash/linux/bin/package.zip) in order to use this compound action. 

## Attack Emulation with SCYTHE

1. Create a new campaign 
2. Select the Compound Action 

## References
- [T1497.001](https://attack.mitre.org/techniques/T1497/001/)

