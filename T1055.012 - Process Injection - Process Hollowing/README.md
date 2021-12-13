# T1055.012 - Process Injection: Process Hollowing

This SCYTHE Compound Action injects another SCYTHE payload into a process that is hollowed. It requires the SCYTHE native module available in the marketplace: https://marketplace.scythe.io/details/process-hollowing/

## Import the Module into SCYTHE
1. Downloaded the Process Hollowing module from the marketplace: https://marketplace.scythe.io/details/process-hollowing/
2. From the SCYTHE GUI, click Administration - Modules
3. Under "Install a module" click "Choose File" and select the module you downloaded from marketplace.

## Import the Compound Action into SCYTHE
1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action

## Create a campaign and add payload to Virtual File System
1. Create a new campaign
2. Download the 32-bit or 64-bit executable
3. Rename to unicorn_shell.exe
3. Upload to VFS/shared/unicorn_shell.exe

## Automated Attack Emulation with SCYTHE
1. Create a new campaign
2. Select the Compound Action for T1055.012
3. Launch the campaign
4. Execute the campaign on a client

## Manual Attack Emulation with SCYTHE
- ```loader --load scythe.phollowing```
- ```scythe.phollowing --src VFS:/shared/unicorn_shell.exe --target C:\Windows\System32\calc.exe```

## References
- https://attack.mitre.org/techniques/T1055/012/