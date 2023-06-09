FROM jenkins/jenkins:lts

# Docker를 설치하기 위한 설정
USER root
RUN apt-get update && \
    apt-get -y install apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg2 \
                       software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io && \
    groupmod -g 998 docker && \
    usermod -aG docker jenkins

# Jenkins 실행
USER jenkins
