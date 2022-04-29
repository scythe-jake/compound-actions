# T1090.002 - External Proxy - Chisel

Uses the open source tool [chisel](https://github.com/jpillora/chisel) to perform reverse SOCKS proxying and reverse port forwarding. This demonstrates how an adversary can use publicly available tools to create network tunnels into a network via a compromised host (a beachhead), allowing them to pivot internally or host attacker services within the network. Via a reverse SOCKS proxy, an adversary may browse websites and access network resources internal to their target. Via a reverse port forward, they may tunnel network connections to the compromised host on to an attacker-controlled service; this may be used for a wide variety of attacks such as credential relaying.

This Compound Action assumes that a chisel server is running on a server you control. This chisel server's configuration is independant of the SCYTHE server. chisel is very easy to deploy. Simply download the released executable from the GitHub repository specific to your operating system and execute it with appropriate command-line parameters (detailed below). The SCYTHE Campaign has variables for the chisel server IP, chisel server port, and the reverse port forwarding port. You may update these to match your configuration.

Video guide:


https://user-images.githubusercontent.com/17090738/166065694-8fb7171a-b00e-4fc8-b69e-33ffade8ab5b.mp4


## Import the Compound Action into SCYTHE
1. Zip up this directory.
2. From the SCYTHE GUI, click Threat Manager - Migrate Threats
3. Under "Import Threat" click “Choose File” and select the ZIP
4. Click Import and OK when complete

## Attack Emulation with SCYTHE
1. Deploy chisel on a server that you control. Provide the `server --reverse` command line parameters to the chisel executable. Ensure that all relevant firewalls allow incoming TCP traffic to port 8080 (by default). You may also specify a listening port for chisel with the `--port` parameter.
2. If you wish to test reverse port forwarding, you may also host a service such as webserver on the chisel server. In our demonstrations, we ran the command `python3 -m http.server` to host a webserver on port 8000. Port 8000 is also the default port for reverse port forwarding that is used in this Campaign. You may change this port by modifying Step 8.
3. Create a new SCYTHE campaign
4. In the Automate Campaign UI, click Existing Threats and select "T1090_002 - External Proxy_chisel". Click "Add Steps".
5. Edit Step 5 to change the IP address for the chisel server.
6. Start the Campaign
7. As the reverse SOCKS connection is made, you will see a log event appear in the chisel server log.
8. The reverse port forward will NOT generate a log event on the chisel server by default. So you will need to test that it works some other way, such as by browsing to `http://localhost:8000` on the target machine where the client is running in order to view the webserver running on port 8000 on the chisel server.

## References
- https://github.com/jpillora/chisel
