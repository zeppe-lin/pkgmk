.POSIX:

include config.mk

BIN8 = pkgmk
MAN5 = pkgmk.conf.5 Pkgfile.5
MAN8 = pkgmk.8

all: ${BIN8} ${MAN5} ${MAN8}

%: %.pod
	pod2man --nourls -r "${NAME} ${VERSION}" -c ' ' \
		-n $(basename $@) -s $(subst .,,$(suffix $@)) $< > $@

%: %.in
	sed "s/@VERSION@/${VERSION}/g" $< > $@

install-dirs:
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man8

install: all install-dirs
	cp -f ${BIN8} ${DESTDIR}${PREFIX}/sbin/
	cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5/
	cp -f ${MAN8} ${DESTDIR}${MANPREFIX}/man8/
	cd ${DESTDIR}${PREFIX}/sbin    && chmod 0755 ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && chmod 0644 ${MAN8}

uninstall:
	cd ${DESTDIR}${PREFIX}/sbin    && rm -f ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && rm -f ${MAN8}

clean:
	rm -f ${BIN8} ${MAN5} ${MAN8}

.PHONY: all install-dirs install uninstall clean
