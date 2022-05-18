# T1027 - Obfuscated PowerShell

Adversaries may attempt to obfuscate commands to bypass defender detections.

Everything as part of this threat runs variations of `Get-Process`

https://github.com/danielbohannon/Invoke-Obfuscation

## Import into SCYTHE

Login to the SCYTHE instance where you want to import the Compound Action.
Click Threat Manager - Migrate Threats
Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
Click Import and OK when complete
Click Threat Manager - Threat Catalog
Find the imported Compound Action and click the tag icon
Tag the MITRE ATT&CK Technique for the Compound Action