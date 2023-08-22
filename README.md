OVERVIEW
--------
This directory contains pkgmk, a package management utility that makes
a software package.

This distribution is a fork of CRUX' pkgmk utility (which is part of
CRUX' pkgutils software) as of commit 9ca0da6 (Sat Nov 17 2018) with
the following differences:
- POSIX sh(1p) with "local"s exception instead of bash(1)
- suckless' sbase support
- aria2c(1) downloader support
- man page in POD format
- Pkgfile(5) man page
- bash completion
- remove "-i", "-u", and "-r" command-line options
- remove signify(1) support
- command-line options/usage in GNU style
- support zstd packages
- allow renaming downloaded tarballs

See git log for complete/further differences.

The original sources can be downloaded from:
1. git://crux.nu/tools/pkgutils.git                        (git)
2. https://crux.nu/gitweb/?p=tools/pkgutils.git;a=summary  (web)


REQUIREMENTS
------------
**Build time**:
- POSIX sh(1p), make(1p) and "mandatory utilities"
- pod2man(1pm) to build man pages

**Runtime**:
- POSIX sh(1p) with "local" support and "mandatory utilities"
- sbase or coreutils
- GNU diffutils
- GNU findutils
- curl(1) or wget(1) or aria2c(1) to download sources
- bsdtar(1) to unpack sources
- pkginfo(1) (from pkgutils package) to make/check package footprint


INSTALL
-------
The shell commands `make && make install` should build and install
this package.


LICENSE
-------
pkgmk is licensed through the GNU General Public License v2 or later
<https://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
