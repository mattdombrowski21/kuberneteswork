FROM registry.access.redhat.com/ubi8/ubi

COPY squid.conf /etc/squid/squid.conf

RUN dnf update -y && \
    dnf -y install squid && \
    dnf clean all

EXPOSE 3128/tcp

ENTRYPOINT /usr/sbin/squid -N