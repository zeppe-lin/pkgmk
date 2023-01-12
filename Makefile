.POSIX:

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
	@echo "=======> Check URLs for response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | \
		grep -E -v 'https?://\*/\*' | \
		xargs -P10 -I{} curl -o /dev/null -sw "%{url} [%{http_code}]\n" '{}'

install: all
	mkdir -p           ${DESTDIR}/usr/sbin
	mkdir -p           ${DESTDIR}/usr/share/man/man5
	mkdir -p           ${DESTDIR}/usr/share/man/man8
	cp -f pkgmk        ${DESTDIR}/usr/sbin/
	cp -f pkgmk.conf.5 ${DESTDIR}/usr/share/man/man5/
	cp -f Pkgfile.5    ${DESTDIR}/usr/share/man/man5/
	cp -f pkgmk.8      ${DESTDIR}/usr/share/man/man8/
	chmod 0755         ${DESTDIR}/usr/sbin/pkgmk
	chmod 0644         ${DESTDIR}/usr/share/man/man5/pkgmk.conf.5
	chmod 0644         ${DESTDIR}/usr/share/man/man5/Pkgfile.5
	chmod 0644         ${DESTDIR}/usr/share/man/man8/pkgmk.8

uninstall:
	rm -f ${DESTDIR}/usr/sbin/pkgmk
	rm -f ${DESTDIR}/usr/share/man/man5/pkgmk.conf.5
	rm -f ${DESTDIR}/usr/share/man/man5/Pkgfile.5
	rm -f ${DESTDIR}/usr/share/man/man8/pkgmk.8

clean:
	rm -f pkgmk pkgmk.8 pkgmk.conf.5 Pkgfile.5

.PHONY: all install uninstall clean
