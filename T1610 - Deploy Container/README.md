# T1610 - Deploy Container

Adversaries may deploy a container into an environment to facilitate execution or evade defenses.

## Docker Deployment of SCYTHE (Linux) Payload

The Dockerfile has an example of how to deploy a SCYTHE payload in a Docker container. Credit to Adam Mashinchi for documenting this procedure.

Assumes:

- Host running the Docker container is Ubuntu (tested with 18.04.5)
- SCYTHE Linux Campaign is created and Payload (64 bit ELF) downloaded to Ubuntu system as "`scythe_linux_payload.out`"
- `Dockerfile` in same directory (as above file)

Example Usage:

```
$ cp ~/Downloads/CampaignName_scythe_client64.out ./scythe_linux_payload.out
$ docker build -t scythe-payload .
$ docker run -d scythe-payload
```