FROM jenkins/jenkins:lts-jdk11
MAINTAINER truelifer
LABEL "GUIDE"="https://docs.docker.com/engine/install/debian/"
USER root
RUN apt update && \
    apt install -y --no-install-recommends ca-certificates curl gnupg && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt update && \
    apt install -y --no-install-recommends docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*
