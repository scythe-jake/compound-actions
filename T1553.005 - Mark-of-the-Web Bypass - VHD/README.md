# T1553.005 - Mark-of-the-Web Bypass: VHD

This compound action seeks to emulate a web browser downloading a potentially malicious VHD file.

## Import into SCYTHE

1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon
7. Tag the MITRE ATT&CK Technique for the Compound Action
8. When you run the emulation rename the executable so the process name matches that of a web browser, like chrome.exe.

## Detection References

1. https://github.com/SigmaHQ/sigma/blob/bcdf13c6802ba6d3656308b90daacfe38c43cf72/rules/windows/file_event/file_event_mal_vhd_download.yml
2. https://redcanary.com/blog/intelligence-insights-october-2021/
