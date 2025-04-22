.POSIX:

include ../config.mk

all:

install:
	mkdir -p $(DESTDIR)$(BASHCOMPDIR)
	cp -f bash_completion $(DESTDIR)$(BASHCOMPDIR)/pkgmk

uninstall:
	rm -f $(DESTDIR)$(BASHCOMPDIR)/pkgmk

clean:

.PHONY: all install uninstall clean
