# See COPYING and COPYRIGHT files for corresponding information.

# pkgmk version
VERSION = 5.41

# paths
PREFIX  = /usr/local
BINDIR  = ${PREFIX}/sbin
ETCDIR  = ${PREFIX}/etc
MANDIR  = ${PREFIX}/share/man

all: pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

%: %.pod
	sed "s|@ETCDIR@|${ETCDIR}|g" $< | pod2man --nourls \
		-r ${VERSION} -c ' ' \
		-n $(basename $@) \
		-s $(subst .,,$(suffix $@)) \
		- > $@

%: %.in
	sed -e "s|@VERSION@|${VERSION}|g" \
	    -e "s|@ETCDIR@|${ETCDIR}|g" \
	    $< > $@

check:
	@podchecker *.pod
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

install: all
	mkdir -p ${DESTDIR}${BINDIR}
	mkdir -p ${DESTDIR}${MANDIR}/man5
	mkdir -p ${DESTDIR}${MANDIR}/man8
	cp -f pkgmk ${DESTDIR}${BINDIR}/
	chmod 0755  ${DESTDIR}${BINDIR}/pkgmk
	cp -f pkgmk.conf.5 Pkgfile.5 ${DESTDIR}${MANDIR}/man5/
	cp -f pkgmk.8                ${DESTDIR}${MANDIR}/man8/

uninstall:
	rm -f ${DESTDIR}${BINDIR}/pkgmk
	rm -f ${DESTDIR}${MANDIR}/man5/pkgmk.conf.5
	rm -f ${DESTDIR}${MANDIR}/man5/Pkgfile.5
	rm -f ${DESTDIR}${MANDIR}/man8/pkgmk.8

clean:
	rm -f pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

.PHONY: all install uninstall clean

# vim:cc=72:tw=70
# End of file.
