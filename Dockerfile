FROM centos:centos7
RUN yum -y install unzip
RUN yum -y install java
RUN yum install -y openssh-clients openssh
RUN yum install -y nano
RUN mkdir /root/luna-docker
RUN mkdir /root/luna-docker/config
RUN mkdir /root/luna-docker/config/certs
COPY 610-000401-002_SW_Minimal_Client_10.2_Linux_RevA.tar /root/luna-docker
RUN tar -xf /root/luna-docker/610-000401-002_SW_Minimal_Client_10.2_Linux_RevA.tar -C /root/luna-docker
RUN cp /root/luna-docker/LunaClient-Minimal-10.2.0-111.x86_64/Chrystoki-template.conf /root/luna-docker/config/Chrystoki.conf
RUN export ChrystokiConfigurationPath=/root/luna-docker/config
# RUN MIN_CLIENT_DIR=/root/luna-docker/LunaClient-Minimal-10.2.0-111.x86_64
COPY install.sh /root/luna-docker
ENTRYPOINT  /bin/bash
#End of the Dockerfile