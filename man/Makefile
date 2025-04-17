.POSIX:

include ../config.mk

MAN5 = pkgmk.32bit.5 pkgmk.conf.5 pkgmk.footprint.5 pkgmk.md5sum.5 \
       pkgmk.nostrip.5 pkgmk.Pkgfile.5
MAN8 = pkgmk.8

all: $(MAN5) $(MAN8)

install: all
	mkdir -p $(DESTDIR)$(MANPREFIX)/man5
	mkdir -p $(DESTDIR)$(MANPREFIX)/man8
	cp -f $(MAN5) $(DESTDIR)$(MANPREFIX)/man5
	cp -f $(MAN8) $(DESTDIR)$(MANPREFIX)/man8
	cd $(DESTDIR)$(MANPREFIX)/man5 && chmod 0644 $(MAN5)
	cd $(DESTDIR)$(MANPREFIX)/man8 && chmod 0644 $(MAN8)

uninstall:
	cd $(DESTDIR)$(MANPREFIX)/man5 && rm -f $(MAN5)
	cd $(DESTDIR)$(MANPREFIX)/man8 && rm -f $(MAN8)

clean:
	rm -f $(MAN5) $(MAN8)

.PHONY: all install uninstall clean
