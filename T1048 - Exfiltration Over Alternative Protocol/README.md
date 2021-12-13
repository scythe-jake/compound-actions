# T1048 - Exfiltration Over Alternative Protocol

Adversaries may steal data by exfiltrating it over a different protocol than that of the existing command and control channel. The data may also be sent to an alternate network location from the main command and control server.

Alternate protocols include FTP, SMTP, HTTP/S, DNS, SMB, or any other network protocol not being used as the main command and control channel. Different protocol channels could also include Web services such as cloud storage. Adversaries may also opt to encrypt and/or obfuscate these alternate channels.

Exfiltration Over Alternative Protocol can be done using various common operating system utilities such as Net/SMB or FTP.[1]

## Download and install the LMO module from the SCYTHE Marketplace
1. If you do not have a marketplace account, submit a SCYTHE support request. The SCYTHE support team will create a Marketplace account for you.
2. Log into SCYTHE’s Marketplace and locate the LMO app.
3. Click the Install button, read and agree to the End User License Agreement and click the Install Now button. The app is now installed on your Marketplace account. 
4. Click the Download button which downloads the .arca file that will be imported into the SCYTHE instance. 

## Import the LMO Module into SCYTHE
1. In the SCYTHE UI, go to Administration> Modules
2. Click Choose File, select the .arca file. 
3. Click the Install button
4. The installed module will show in the list.

## Import the Compound Action
1. Click Threat Manager - Migrate Threats
2. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action