.ONESHELL:
SHELL = /bin/bash
.SHELLFLAGS += -e

MAIN_TARGET = hellomake_$(CONFIGURED_ARCH).deb
DERIVED_TARGETS = hellomake_$(CONFIGURED_ARCH).deb

$(addprefix $(DEST)/, $(MAIN_TARGET)): $(DEST)/% :

	pushd ./helloworld

	# Build source and Debian packages
	mkdir -p hellomake_$(CONFIGURED_ARCH)/usr/bin/
	rm -f hellomake_$(CONFIGURED_ARCH)/usr/bin/*
	mkdir -p hellomake_$(CONFIGURED_ARCH)/DEBIAN

	autoreconf -ivf
	./configure
	make
	cp helloMake hellomake_$(CONFIGURED_ARCH)/usr/bin/.
	
	#dpkg-buildpackage -rfakeroot -b -us -uc -j$(SONIC_CONFIG_MAKE_JOBS)
	dpkg-deb --nocheck --root-owner-group --build hellomake_$(CONFIGURED_ARCH) 

	mv $(DERIVED_TARGETS) $* $(DEST)/
	popd
	
$(addprefix $(DEST)/, $(DERIVED_TARGETS)): $(DEST)/% : $(DEST)/$(MAIN_TARGET)