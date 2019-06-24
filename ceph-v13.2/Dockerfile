FROM ceph/ceph:v13.2

COPY cephcsi /usr/local/bin/

RUN chmod +x /usr/local/bin/cephcsi && \
    ln -sf /usr/local/bin/cephcsi /usr/local/bin/rbdplugin

ENTRYPOINT ["/usr/local/bin/rbdplugin"]
