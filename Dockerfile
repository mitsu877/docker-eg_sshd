FROM ubuntu:16.04
MAINTAINER mitsu877

RUN apt-get update && apt-get install -y openssh-server sudo python2.7
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/session\s*required\s*pam_loginuid.so/session optional pam_loginuid.so/g' /etc/pam.d/sshd

COPY start.sh /start.sh

EXPOSE 22
ENTRYPOINT ["/start.sh"]
