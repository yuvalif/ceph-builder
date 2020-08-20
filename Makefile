SUBDIRS := ubuntu16 ubuntu18 centos7 centos8 fedora31 fedora32 opensuse15

image build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: image build  $(SUBDIRS)
