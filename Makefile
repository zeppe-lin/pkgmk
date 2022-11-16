# This file is a part of pkgmk.
# See COPYING and COPYRIGHT files for corresponding information.

# pkgmk version
VERSION = 5.41

# paths
PREFIX  = /usr/local
BINDIR  = ${PREFIX}/sbin
MANDIR  = ${PREFIX}/share/man

all: pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

%: %.in
	sed -e "s/@VERSION@/${VERSION}/g" $< > $@

install: all
	install -m 0755 -Dt ${DESTDIR}${BINDIR}/      pkgmk
	install -m 0644 -Dt ${DESTDIR}${MANDIR}/man8/ pkgmk.8
	install -m 0644 -Dt ${DESTDIR}${MANDIR}/man5/ pkgmk.conf.5 \
		Pkgfile.5

uninstall:
	rm -f ${DESTDIR}${BINDIR}/pkgmk
	rm -f ${DESTDIR}${MANDIR}/man8/pkgmk.8
	rm -f ${DESTDIR}${MANDIR}/man5/pkgmk.conf.5
	rm -f ${DESTDIR}${MANDIR}/man5/Pkgfile.5

clean:
	rm -f pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

.PHONY: all install uninstall clean

# vim:cc=72:tw=70
# End of file.
