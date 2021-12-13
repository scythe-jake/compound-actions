# T1547.001 - Registry Run Keys / Startup Folder: Atomic Test 7

This compound action leverages PowerShell to add an lnk shortcut to the startup folder. This was a detection opportunity laid out in Red Canary's Intelligence Insights: October 2021. This Atomic test is also available at https://github.com/redcanaryco/atomic-red-team/blob/36d49de4c8b00bf36054294b4a1fcbab3917d7c5/atomics/T1547.001/T1547.001.md#atomic-test-7---add-executable-shortcut-link-to-user-startup-folder.

## Import into SCYTHE

1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon
7. Tag the MITRE ATT&CK Technique for the Compound Action
8. Upload the files in VFS folder into VFS/shared/T1547

## Detection References

1. https://redcanary.com/blog/intelligence-insights-october-2021/
> process_name == powershell.exe && process_command_line_contains == appdata && filemod_path_contains == start menu\programs\startup && filemod_extension == .lnk
2. https://github.com/SigmaHQ/sigma/blob/master/rules/windows/file_event/sysmon_powershell_startup_shortcuts.yml
