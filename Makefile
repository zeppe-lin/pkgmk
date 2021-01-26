#
#  pkgmk - Make software package.
#
#  Copyright (c) 2000-2005 by Per Liden <per@fukt.bth.se>
#  Copyright (c) 2006-2017 by CRUX team (http://crux.nu)
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, 
#  USA.
#

DESTDIR =
PREFIX  = /usr/local
BINDIR  = $(PREFIX)/sbin
MANDIR  = $(PREFIX)/share/man
ETCDIR  = /etc

NAME    = pkgmk
VERSION = 5.40.7

all: pkgmk pkgmk.8 pkgmk.conf.5

%: %.in
	sed -e "s/#VERSION#/$(VERSION)/" $< > $@

install: all
	install -Dm0755 pkgmk        $(DESTDIR)$(BINDIR)/pkgmk
	install -Dm0644 pkgmk.conf   $(DESTDIR)$(ETCDIR)/pkgmk.conf
	install -Dm0644 pkgmk.8      $(DESTDIR)$(MANDIR)/man8/pkgmk.8
	install -Dm0644 pkgmk.conf.5 $(DESTDIR)$(MANDIR)/man5/pkgmk.conf.5

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/pkgmk
	rm -f $(DESTDIR)$(ETCDIR)/pkgmk.conf
	rm -f $(DESTDIR)$(MANDIR)/man8/pkgmk.8
	rm -f $(DESTDIR)$(MANDIR)/man5/pkgmk.conf.5

clean:
	rm -f pkgmk pkgmk.8 pkgmk.conf.5

.PHONY: install uninstall clean

# End of file.
