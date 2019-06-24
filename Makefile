
RBD_IMAGE_NAME=$(if $(ENV_RBD_IMAGE_NAME),$(ENV_RBD_IMAGE_NAME),quay.io/cephcsi/rbdplugin)
RBD_IMAGE_VERSION=$(if $(ENV_RBD_IMAGE_VERSION),$(ENV_RBD_IMAGE_VERSION),v1.0.0)


CSI_IMAGE_NAME?=zhangzhonglin/cephcsi-rbdplugin

CEPH_VERSION_12?=v12.2
CEPH_VERSION_13?=v13.2
CEPH_VERSION_14?=v14.2

CEPH_DIR_12?=ceph-v12.2
CEPH_DIR_13?=ceph-v13.2
CEPH_DIR_14?=ceph-v14.2

all: cephcsi-v12.2 cephcsi-v13.2 cephcsi-v14.2

cephcsi-v12.2:
	cp cephcsi $(CEPH_DIR_12)/
	docker build -t $(CSI_IMAGE_NAME):$(CEPH_VERSION_12) $(CEPH_DIR_12)
	rm $(CEPH_DIR_12)/cephcsi -f
	#docker push $(CSI_IMAGE_NAME):$(CEPH_VERSION_12)

cephcsi-v13.2:
	cp cephcsi $(CEPH_DIR_13)/
	docker build -t $(CSI_IMAGE_NAME):$(CEPH_VERSION_13) $(CEPH_DIR_13)
	rm $(CEPH_DIR_13)/cephcsi
	#docker push $(CSI_IMAGE_NAME):$(CEPH_VERSION_13)

cephcsi-v14.2:
	cp cephcsi $(CEPH_DIR_14)/
	docker build -t $(CSI_IMAGE_NAME):$(CEPH_VERSION_14) $(CEPH_DIR_14)
	rm $(CEPH_DIR_14)/cephcsi
	#docker push $(CSI_IMAGE_NAME):$(CEPH_VERSION_14)


.PHONY: all cephcsi-v12.2 cephcsi-v13.2 cephcsi-v14.2
