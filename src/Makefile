.POSIX:

include ../config.mk

BIN8 = pkgmk

all: $(BIN8)

$(BIN8):
	sed "s/@VERSION@/$(VERSION)/" $@.in > $@ && chmod 0755 $@

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/sbin
	cp -f $(BIN8) $(DESTDIR)$(PREFIX)/sbin
	cd $(DESTDIR)$(PREFIX)/sbin && chmod 0644 $(BIN8)

uninstall:
	cd $(DESTDIR)$(PREFIX)/sbin && rm -f $(BIN8)

clean:
	rm -f $(BIN8)

.PHONY: all install uninstall clean
