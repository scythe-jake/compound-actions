# T1057 - Process Discovery

Adversaries may perform process discovery to learn more about the environment they are operating in. 

This compound action is meant to test multiple data sources by leveraging several different execution methods in Windows:
<ul>
<li>Windows Command Line</li>
<li>Windows PowerShell</li>
<li>Windows Unmanaged PowerShell</li>
<li>Windows Management Instrumentation (WMI)</li>
<li>Native API</li>
</ul>

## Import into SCYTHE

1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon
7. Tag the MITRE ATT&CK Technique for the Compound Action
