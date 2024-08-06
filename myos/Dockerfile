FROM rockylinux:8.5

RUN rm -f /etc/yum.repos.d/*
ADD repos.tar.gz /etc/yum.repos.d/
RUN dnf install -y net-tools vim-enhanced tree bash-completion iproute procps-ng psmisc \
    && dnf clean all
