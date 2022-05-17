#  T1021 - Remote Services

Adversaries may use Valid Accounts to log into a service specifically designed to accept remote connections, such as telnet, SSH, and VNC. The adversary may then perform actions as the logged-on user.

In an enterprise environment, servers and workstations can be organized into domains. Domains provide centralized identity management, allowing users to login using one set of credentials across the entire network. If an adversary is able to obtain a set of valid domain credentials, they could login to many different machines using remote access protocols such as secure shell (SSH) or remote desktop protocol (RDP).

Legitimate applications (such as Software Deployment Tools and other administrative programs) may utilize Remote Services to access remote hosts. For example, Apple Remote Desktop (ARD) on macOS is native software used for remote management. ARD leverages a blend of protocols, including VNC to send the screen and control buffers and SSH for secure file transfer. Adversaries can abuse applications such as ARD to gain remote code execution and perform lateral movement. In versions of macOS prior to 10.14, an adversary can escalate an SSH session to an ARD session which enables an adversary to accept TCC (Transparency, Consent, and Control) prompts without user interaction and gain access to data.

## Import the Compound Action into SCYTHE
1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threat" click "Choose File" and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action

## Automated Emulation with SCYTHE
1. Create a new campaign
2. Select the Compound Action by MITRE ATT&CK tag

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