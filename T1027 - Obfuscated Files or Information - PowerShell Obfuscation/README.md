# T1027 - Obfuscated PowerShell

Adversaries may attempt to obfuscate commands to bypass defender detections.

Everything as part of this threat runs variations of `Get-Process`

https://github.com/danielbohannon/Invoke-Obfuscation

## Import into SCYTHE

1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon
7. Tag the MITRE ATT&CK Technique for the Compound Action

## SIGMA

1. [Suspicious Process Discovery With Get-Process](https://github.com/SigmaHQ/sigma/blob/41fce11b7658e33861946c6e6fd8ed640d9186ec/rules/windows/powershell/powershell_script/posh_ps_susp_get_process.yml)
