# hashcat-hashtopolis-agent
Docker container with the latest version of hashcat and hashtopolis python agent used for distributed hash cracking.

### Build ARGs:
The following ARGs are available with the Dockerfile at build to automate the setup of the agent. Add --build-arg key=value to docker build for these values:

- ARG AGENT_DOWNLOAD_URL
- ARG voucher_ID
- ARG hashtopolis_server_url

### Docker Image:
https://hub.docker.com/r/joshmsimpson/hashcat-hashtopolis-agent

### Resources:
- https://github.com/NVIDIA/nvidia-docker
