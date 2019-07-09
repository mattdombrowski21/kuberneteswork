FROM registry.access.redhat.com/ubi8/ubi

RUN dnf update -y && \
    dnf -y install squid && \
    dnf clean all && \
    mkdir myVol

EXPOSE 3128/tcp
