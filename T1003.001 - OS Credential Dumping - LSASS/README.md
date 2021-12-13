# T1003.001 - OS Credential Dumping: LSASS Memory

Adversaries may attempt to access credential material stored in the process memory of the Local Security Authority Subsystem Service (LSASS). After a user logs on, the system generates and stores a variety of credential materials in LSASS process memory. These credential materials can be harvested by an administrative user or SYSTEM and used to conduct Lateral Movement using Use Alternate Authentication Material.

As well as in-memory techniques, the LSASS process memory can be dumped from the target host and analyzed on a local system.

## Import the Compound Action into SCYTHE
1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action

## Attack Emulation with SCYTHE
1. Create a new campaign
2. Select the Compound Action

## Manual Defender Bypass
- Place procdump in "C:\Program Files (x86)\Microsoft Visual Studio\"
- Rename to dump64.exe
- Execute from a cmd.exe with local admin priv:

``` dump64.exe -ma <PID> out.dmp ```

### Notes
- Cannot use the full path of dump64.exe, must be executed from within the Microsoft Visual Studio directory
- Cannot use the word "lsass" anywhere (you have to use the PID)
- Have to dump to the local directory
- Cannot accept eula

## References
- https://attack.mitre.org/techniques/T1003/001/
- https://twitter.com/mrd0x/status/1460597833917251595
- https://github.com/SigmaHQ/sigma/blob/f36b1cbd2a3f1a7423f43a67a182549778700615/rules/windows/process_creation/win_susp_procdump.yml