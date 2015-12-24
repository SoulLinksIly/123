FROM debian:latest
MAINTAINER Fernando Mayo <soullink.ily@gmail.com>

# Install packages
RUN apt-get update && \
    apt-get -y install openssh-server pwgen && \
    mkdir -p /var/run/sshd && \
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    apt-get install wget -y && \
    wget http://down.senra.me/laozuo-xp.img
    

ADD debianxp.sh /debianxp.sh
ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**

EXPOSE 22
EXPOSE 3389
CMD ["/debianxp.sh"]
CMD ["/run.sh"]
