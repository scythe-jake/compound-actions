# T1072 - Software Deployment Tools: ATERA

This compound action seeks to emulate the installation of the ATERA management agent by adding the software's registry key.

## Import into SCYTHE

1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon
7. Tag the MITRE ATT&CK Technique for the Compound Action

## Detection References

1. https://redcanary.com/blog/intelligence-insights-october-2021/
> registry_modification_path_contains == ATERA Networks

