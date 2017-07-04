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
	@echo "Make directory"
	mkdir -p $(INSTALLDIR)/$(INSTALLPATH)
	@echo "Install file"
	install -m 0755 bin/$(ARCH)/$(BZIP2NAME) $(INSTALLDIR)/$(INSTALLPATH)
	bunzip2 $(INSTALLDIR)/$(INSTALLPATH)/$(BZIP2NAME)

.PHONY: all clean install
