# T1070.004 - File Deletion

This compound action seeks to emulate the usage of adversaries downloading Windows Sysinternals tools and using SDelete on itself. The compound action can also be used as a template to leverage other Sysinternals tools.

## Import into SCYTHE

1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon
7. Tag the MITRE ATT&CK Technique for the Compound Action

## SIGMA Detection
1. [Sysinternals SDelete Registry Keys](https://github.com/SigmaHQ/sigma/blob/bc316855f6bcb0233f5e66bcba32beea36d4feb8/rules/windows/registry/registry_add/registry_add_sysinternals_sdelete_registry_keys.yml)
