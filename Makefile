.POSIX:

include config.mk

all:

install:
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	sed "s/@VERSION@/${VERSION}/" pkgmk \
		> ${DESTDIR}${PREFIX}/sbin/pkgmk
	cp -f pkgmk.conf.5 ${DESTDIR}${MANPREFIX}/man5/
	cp -f Pkgfile.5    ${DESTDIR}${MANPREFIX}/man5/
	cp -f pkgmk.8      ${DESTDIR}${MANPREFIX}/man8/
	chmod 0755 ${DESTDIR}${PREFIX}/sbin/pkgmk
	chmod 0644 ${DESTDIR}${MANPREFIX}/man5/pkgmk.conf.5
	chmod 0644 ${DESTDIR}${MANPREFIX}/man5/Pkgfile.5
	chmod 0644 ${DESTDIR}${MANPREFIX}/man8/pkgmk.8

uninstall:
	rm -f ${DESTDIR}${PREFIX}/sbin/pkgmk
	rm -f ${DESTDIR}${MANPREFIX}/man5/pkgmk.conf.5
	rm -f ${DESTDIR}${MANPREFIX}/man5/Pkgfile.5
	rm -f ${DESTDIR}${MANPREFIX}/man8/pkgmk.8

install_bashcomp:
	mkdir -p ${DESTDIR}${BASHCOMPDIR}
	cp -f bash_completion ${DESTDIR}${BASHCOMPDIR}/pkgmk

uninstall_bashcomp:
	rm -f ${DESTDIR}${BASHCOMPDIR}/pkgmk

clean:
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall install_bashcomp uninstall_bashcomp clean dist
