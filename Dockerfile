# ***********************************************************************************************************************************************
# This Dockerfile pulls the latest Hashcat binaries and Hashtopolis Agent from github for use within a Hashtopolis password cracking server.
# docker run --runtime=nvidia -ti joshmsimpson/hashcat-hashtopolis-agent /bin/bash
# 
# Once in the container, you can begin the registration process:
#
# python3 . --voucher_ID ${voucher_ID} --url ${hashtopolis_server_url}
# Supply ARGs at build. Ex. --build-arg voucher_ID=ABCDEFG

FROM nvidia/opencl:devel-ubuntu16.04

LABEL version="0.1"
LABEL repo="https://github.com/joshmsimpson/hashcat-hashtopolis-agent"

# For Basic_Auth and HTTPS Proxies
# ENV http_proxy=
# ENV https_proxy=

# PROVIDE AT BUILD Via --build-arg -- Set To HASHTOPOLIS SERVER INFO -- Located in the add agent page in Hashtopolis -- default is hashtopolis-agent github
ARG AGENT_DOWNLOAD_URL="https://github.com/s3inlc/hashtopolis-agent-python/archive/v0.6.0.zip"

# modify for build
ARG voucher_ID
ARG hashtopolis_server_url

# OS Dep and App Libs
ENV HOME /root
RUN apt-get update && apt-get install -y build-essential gcc git ca-certificates python3 python3-pip python3-setuptools python-setuptools curl wget screen unzip
RUN pip3 install --upgrade pip
RUN pip3 install requests psutil

# Latest Hashcat
WORKDIR /home/hashcat
RUN git clone https://github.com/hashcat/hashcat.git . && git submodule update --init && make install

# Hashtopolis-Agent
WORKDIR /home/hashtopolis-agent
RUN wget -O hashtopolis.zip ${AGENT_DOWNLOAD_URL}
RUN chmod +x hashtopolis.zip
RUN unzip hashtopolis.zip
WORKDIR /home/hashtopolis-agent/hashtopolis-agent-python-0.6.0/

# Set config.json from --build-arg
# Use config.json as a template if needed.
COPY config.json /home/hashtopolis-agent/hashtopolis-agent-python-0.6.0/config.json
RUN sed -i "s@SERVER_URL@$hashtopolis_server_url@g" /home/hashtopolis-agent/hashtopolis-agent-python-0.6.0/config.json
RUN sed -i "s@VOUCHER_ID@$voucher_ID@g" /home/hashtopolis-agent/hashtopolis-agent-python-0.6.0/config.json
