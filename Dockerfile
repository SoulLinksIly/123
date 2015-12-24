FROM debian:latest
MAINTAINER Fernando Mayo <soullink.ily@gmail.com>

# Install packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get -y install xorg lxde-core tightvncserver && \
    apt-get -y install openssh-server pwgen && \
    mkdir -p /var/run/sshd && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    apt-get install wget -y

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**

EXPOSE 5901
EXPOSE 22

CMD ["/debianxp.sh"]
CMD ["/run.sh"]
