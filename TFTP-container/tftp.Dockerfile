FROM registry.access.redhat.com/ubi8/ubi

RUN dnf update -y && \
    dnf -y install tftp-server \
    dnf clean all

EXPOSE 69

CMD /usr/sbin/in.tftpd --foreground --address 0.0.0.0:69 --secure /var/lib/tftpboot --create