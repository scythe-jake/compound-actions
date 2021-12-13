# T1553.005 - Subvert Trust Controls: Mark-of-the-Web Bypass

Adversaries may abuse specific file formats, such as ISO, to evade Mark-of-the-Web (MOTW) controls. 

1. Copy the ISO file in the VFS folder to your SCYTHE server VFS:/shared/ISO
2. Inport and tag the imported Compound Action in your Threat Catalog as T1553.005
3. Create a new campaign and select the T1553.005 compound action

## ISO Deployment of SCYTHE (Windows) Payload

The below procedure uses the Folder2Iso project to build an ISO that can be mounted on a Windows system. If the ISO was downloaded from the Internet, it will bypass the Mark of the Web warning. Opening the Reports shortcut will execute the SCYTHE DLL payload.

1. Set up Command and Control (C2) using HTTPS and TCP 443 and generate DLL payload. If you are a SCYTHE user, create a new SCYTHE campaign, download a 32-bit or 64-bit DLL with the entry-point function name of `Open` 
2. Copy the src folder from our GitHub to a working directory on your Windows system. Note we are using the Folder2Iso project to create the ISO.
3. Copy and rename the SCYTHE DLL to `DOCUMENTS.dll` and put it in the Folder2Iso of the working directory
4. In the Folder2Iso directory, create a shortcut called Reports and set the Target to: `C:\Windows\System32\rundll32.exe "DOCUMENTS.DLL",Open`
5. Open a Windows command prompt and cd to the working directory.
6. Run `Folder2Iso.exe "Folder2Iso" "%USERPROFILE%\Downloads\T1553.005.iso" "DECLASS" 0 0 0 "None"` This will take all the content of the Folder2Iso folder and create an ISO of it.
7. Email the ISO file, host it on a web server and send a phishing link, double click it on your host, and/or execute from command line with `powershell Mount-DiskImage -ImagePath "%USERPROFILE%\Downloads\T1553.005.iso"` 
8. In the newly mounted drive, double clicking the Reports shortcut which will launch the DOCUMENTS.dll SCYTHE Campaign.
