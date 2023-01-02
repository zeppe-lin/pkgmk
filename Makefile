# pkgmk version
VERSION = 5.41

all: pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

%: %.in
	sed -e "s|@VERSION@|${VERSION}|g" $< > $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for non-200 response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

install: all
	mkdir -p ${DESTDIR}/usr/sbin
	mkdir -p ${DESTDIR}/usr/share/man/man5
	mkdir -p ${DESTDIR}/usr/share/man/man8
	cp -f pkgmk ${DESTDIR}/usr/sbin/
	chmod 0755  ${DESTDIR}/usr/sbin/pkgmk
	cp -f pkgmk.conf.5 Pkgfile.5 ${DESTDIR}/usr/share/man/man5/
	cp -f pkgmk.8                ${DESTDIR}/usr/share/man/man8/

uninstall:
	rm -f ${DESTDIR}/usr/sbin/pkgmk
	rm -f ${DESTDIR}/usr/share/man/man5/pkgmk.conf.5
	rm -f ${DESTDIR}/usr/share/man/man5/Pkgfile.5
	rm -f ${DESTDIR}/usr/share/man/man8/pkgmk.8

clean:
	rm -f pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

.PHONY: all install uninstall clean
