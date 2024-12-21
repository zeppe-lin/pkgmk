.POSIX:

include config.mk

BIN8 = pkgmk
MAN5 = pkgmk.conf.5 Pkgfile.5
MAN8 = pkgmk.8

all: pkgmk

pkgmk:
	cd src && sed "s/@VERSION@/${VERSION}/" $@.in > $@ && chmod 0755 $@

install: all
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	cd src && cp -f ${BIN8} ${DESTDIR}${PREFIX}/sbin
	cd man && cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5
	cd man && cp -f ${MAN8} ${DESTDIR}${MANPREFIX}/man8
	cd ${DESTDIR}${PREFIX}/sbin    && chmod 0755 ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && chmod 0644 ${MAN8}

uninstall:
	cd ${DESTDIR}${PREFIX}/sbin    && rm -f ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && rm -f ${MAN8}

install_bashcomp:
	mkdir -p ${DESTDIR}${BASHCOMPDIR}
	cp -f extra/bash_completion ${DESTDIR}${BASHCOMPDIR}/pkgmk

uninstall_bashcomp:
	rm -f ${DESTDIR}${BASHCOMPDIR}/pkgmk

clean:
	cd src && rm -f ${BIN8}
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all ${BIN8} install uninstall install_bashcomp uninstall_bashcomp clean dist
