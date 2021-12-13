# T1491.001 - Internal Defacement
This compound action changes the desktop wallpapaer on Windows using powershell.

## Import into SCYTHE
1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon 
7. Tag the MITRE ATT&CK Technique for the Compound Action
8. Upload the files in VFS folder into VFS/shared/Ransomware

## Manual Execution
1. Move the wallchange.ps1 onto the target system
2. Execute it from a command prompt with either:
```
powershell Set-ExecutionPolicy Bypass; IEX -command $ENV:UserProfile\appdata\local\temp\wallchange.ps1
```
```
powershell -executionpolicy bypass -file "%USERPROFILE%/AppData/Local/Temp/wallchange.ps1"
```