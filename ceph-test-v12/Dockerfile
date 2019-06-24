FROM centos:7.4.1708

COPY ceph.repo /etc/yum.repos.d/
COPY rbdplugin /usr/local/bin/

RUN chmod +x /usr/local/bin/rbdplugin && \
    yum install -y ceph-common e2fsprogs xfsprogs rbd-nbd net-tools telnet && \
    yum clean all

ENTRYPOINT ["/usr/local/bin/rbdplugin"]
