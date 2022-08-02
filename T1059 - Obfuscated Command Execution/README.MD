# T1059 - Command execution through obfuscation

This compound action performs execution using environment variable substitution. Normally, environment variable substitution uses % signs (e.g. %USERNAME%). In this emulation, we need to delay execution of the environment variables until after the new shell is loaded. This requires the /v argument and uses ! for the child shell vs % in the parent shell. 

## Import into SCYTHE

1. Import the file obfuscated_cmd_execution_scythe_threat.json into threats.
2. Execute and observe that calc.exe is launched.

## Notes
This threat depends on downloading https://pastebin.com/raw/vptSeT8Q for downloading commands into a file po.bat.

The po.bat file runs calc.exe and deletes po.bat from the disk.

Note that the obfuscation does not require PowerShell or a batch script for that matter. It is used here to show how obfuscation can be used in the command prompt without dealing with PowerShell obfuscated commands.
