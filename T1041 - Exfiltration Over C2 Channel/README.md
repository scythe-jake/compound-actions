# T1041 - Exfiltration via C2 Channel

Malicious actors may exfiltratate (steal) data through the active command and control (C2) channel. This compound action uploads sample sensitive data provided by https://dlptest.com in a variety of formats (CSV, DOCX, XLS, and PDF). It then exfiltrates the data through the C2 channel used by the SCYTHE payload to communicate with the SCYTHE server. This is a good use case for testing Data Leakage Prevention (DLP) solutions.

Import the JSON and tag it as T1041 in the Threat Catalog. Then upload the files in the VFS folder in VFS:/shared/DLPTest 

We recommend testing this compound action through a variety of C2 channels such as HTTP and HTTPS, especially if TLS decryption is not enabled outbound, to determine if DLP controls are implemented correctly.
