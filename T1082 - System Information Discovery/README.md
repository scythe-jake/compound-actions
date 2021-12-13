# T1082 - System Information Discovery

This SCYTHE Compound Action pulls information about the system from the Windows set up logs located in %WINDIR%\inf\setupapi.setup.log

## Import the Compound Action into SCYTHE
1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action

## Attack Emulation with SCYTHE
1. Create a new campaign
2. Select the Compound Action for 1082

## Manual Emulation
- type %WINDIR%\inf\setupapi.setup.log

## References
- https://attack.mitre.org/techniques/T1082/
- https://mobile.twitter.com/arkbird_solg/status/1441876714246885381?s=21