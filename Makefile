INSTALLDIR = $(DESTDIR)
ARCH ?= $(shell uname -m|sed 's/i.86/i386/'|sed 's/^arm.*/arm/')
INSTALLPATH = '/usr/local/bin'
BINNAME = 'ipfs'
BZIP2NAME = 'ipfs.bz2'

ifeq ($(ARCH),amd64)
	ARCH = x86_64
endif

all:
	@echo "all"
clean:
	@echo "clean"
install:
	@echo "Make required directories"
	mkdir -p $(INSTALLDIR)/$(INSTALLPATH)
	mkdir -p $(INSTALLDIR)/etc/init.d/
	@echo "Install files"
	install -m 0755 bin/$(ARCH)/$(BZIP2NAME) $(INSTALLDIR)/$(INSTALLPATH)
	install -m 0755 init.d/cloudy-ipfs $(INSTALLDIR)/etc/init.d/
	bunzip2 $(INSTALLDIR)/$(INSTALLPATH)/$(BZIP2NAME)

.PHONY: all clean install
