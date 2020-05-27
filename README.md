# hashcat-hashtopolis-agent
Docker container with the latest version of hashcat and hashtopolis python agent used for distributed hash cracking.

hashcat-hashtopolis-agent
Docker container with the latest version of hashcat and hashtopolis python agent used for distributed hash cracking.

### Basic Usage:
Depending on your version of docker your basic launch options might look like some of the following:

- docker run --runtime=nvidia -ti joshmsimpson/hashcat-hashtopolis-agent /bin/bash

or

- docker run --gpus all -ti joshmsimpson/hashcat-hashtopolis-agent /bin/bash

Once in the container follow the Hashtopolis Agent Instructions to register the container:

Example:

```
root@d39784c8514f:/home/hashtopolis-agent/hashtopolis-agent-python-0.6.0# ll
total 60
drwxr-xr-x 1 root root  4096 May 27 16:59 ./
drwxr-xr-x 1 root root  4096 May 27 16:59 ../
-rw-r--r-- 1 root root    95 Feb 11 14:20 .gitignore
-rw-r--r-- 1 root root   184 Feb 11 14:20 .travis.yml
-rw-r--r-- 1 root root  6118 Feb 11 14:20 README.md
-rw-r--r-- 1 root root 14072 Feb 11 14:20 __main__.py
-rwxr-xr-x 1 root root   576 Feb 11 14:20 build.sh*
-rw-r--r-- 1 root root  3397 Feb 11 14:20 changelog.md
-rw-r--r-- 1 root root    35 May 27 16:59 config.json
drwxr-xr-x 2 root root  4096 Feb 11 14:20 htpclient/
-rw-r--r-- 1 root root    16 Feb 11 14:20 requirements.txt
root@d39784c8514f:/home/hashtopolis-agent/hashtopolis-agent-python-0.6.0# python3 __main__.py 
Starting client 's3-python-0.6.0'...
Please enter the url to the API of your Hashtopolis installation:
```
### Advanced Usage:

Example usage, providing container specific GPU IDs to expand on hashtopolis task oriented design allowing you to 'task' individual or group of GPUs by binding them to containers. 

- docker run --gpus '"device=0,1,2,etc"' -ti joshmsimpson/hashcat-hashtopolis-agent /bin/bash

### Build ARGs:
The following ARGs are available with the Dockerfile at build to automate the setup of the agent. Add --build-arg key=value to docker build for these values:

- ARG AGENT_DOWNLOAD_URL
- ARG voucher_ID
- ARG hashtopolis_server_url

### Docker Image:
- https://hub.docker.com/r/joshmsimpson/hashcat-hashtopolis-agent

### Resources:
- https://github.com/NVIDIA/nvidia-docker
- https://github.com/NVIDIA/nvidia-docker
- https://github.com/joshmsimpson/hashcat-hashtopolis-agent
- https://github.com/s3inlc/hashtopolis-agent-python
- https://github.com/s3inlc/hashtopolis
- https://hub.docker.com/r/kpeiruza/hashtopolis/dockerfile
