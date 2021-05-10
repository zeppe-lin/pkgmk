
PREFIX  = /usr/local
BINDIR  = $(PREFIX)/sbin
MANDIR  = $(PREFIX)/share/man
ETCDIR  = /etc

NAME    = pkgmk
VERSION = 5.40.7

all: pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

%: %.in
	sed -e "s/#VERSION#/$(VERSION)/" $< > $@

install: all
	install -m 755 -D pkgmk        $(DESTDIR)$(BINDIR)/pkgmk
	install -m 644 -D pkgmk.8      $(DESTDIR)$(MANDIR)/man8/pkgmk.8
	install -m 644 -D pkgmk.conf   $(DESTDIR)$(ETCDIR)/pkgmk.conf
	install -m 644 -D pkgmk.conf.5 $(DESTDIR)$(MANDIR)/man5/pkgmk.conf.5
	install -m 644 -D Pkgfile.5    $(DESTDIR)$(MANDIR)/man5/Pkgfile.5

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/pkgmk
	rm -f $(DESTDIR)$(MANDIR)/man8/pkgmk.8
	rm -f $(DESTDIR)$(ETCDIR)/pkgmk.conf
	rm -f $(DESTDIR)$(MANDIR)/man5/pkgmk.conf.5
	rm -f $(DESTDIR)$(MANDIR)/man5/Pkgfile.5

clean:
	rm -f pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

.PHONY: install uninstall clean

