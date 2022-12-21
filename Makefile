# pkgmk version
VERSION = 5.41

# paths
PREFIX     = /usr/local
MANPREFIX  = ${PREFIX}/share/man
SYSCONFDIR = ${PREFIX}/etc

all: pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

%: %.pod
	sed "s|@SYSCONFDIR@|${SYSCONFDIR}|g" $< | pod2man --nourls \
		-r ${VERSION} -c ' ' \
		-n $(basename $@) \
		-s $(subst .,,$(suffix $@)) \
		- > $@

%: %.in
	sed -e "s|@VERSION@|${VERSION}|g" \
	    -e "s|@SYSCONFDIR@|${SYSCONFDIR}|g" \
	    $< > $@

check:
	@podchecker *.pod
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

install: all
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	cp -f pkgmk ${DESTDIR}${PREFIX}/sbin/
	chmod 0755  ${DESTDIR}${PREFIX}/sbin/pkgmk
	cp -f pkgmk.conf.5 Pkgfile.5 ${DESTDIR}${MANPREFIX}/man5/
	cp -f pkgmk.8                ${DESTDIR}${MANPREFIX}/man8/

uninstall:
	rm -f ${DESTDIR}${PREFIX}/sbin/pkgmk
	rm -f ${DESTDIR}${MANPREFIX}/man5/pkgmk.conf.5
	rm -f ${DESTDIR}${MANPREFIX}/man5/Pkgfile.5
	rm -f ${DESTDIR}${MANPREFIX}/man8/pkgmk.8

clean:
	rm -f pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

.PHONY: all install uninstall clean
