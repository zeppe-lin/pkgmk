OVERVIEW
========

This repository contains pkgmk, a package management utility that
makes a software package.

This distribution is a fork of CRUX' pkgmk utility (which is part of
CRUX' pkgutils software) as of commit 9ca0da6 (Sat Nov 17 2018) with
the following differences:
  * POSIX sh(1p) with "local"s exception instead of bash(1)
  * suckless' sbase support
  * aria2c(1) downloader support
  * manual pages in mdoc(7) format
  * new Pkgfile(5) manual page
  * bash completion
  * removed "-i", "-u", and "-r" command-line options
  * removed signify(1) support
  * GNU-style options/help/usage
  * zstd packages support
  * allow renaming downloaded tarballs
  * ignore extended attributes when extracting tarballs
  * support specifying the format for the created archives

See git log for complete/further differences.

The original sources can be downloaded from:
  * https://git.crux.nu/tools/pkgutils.git


REQUIREMENTS
============

Build time
----------
  * POSIX sh(1p), make(1p) and "mandatory utilities"

Runtime
-------
  * POSIX sh(1p) with "local" support and "mandatory utilities"
  * sbase or coreutils
  * GNU diffutils
  * GNU findutils
  * curl(1) or wget(1) or aria2c(1) to download sources
  * bsdtar(1) to unpack sources
  * pkginfo(1) (from pkgutils) to make/check package footprint


INSTALL
=======

The shell command `make install` should install this package.

See `config.mk` for configuration parameters.


DOCUMENTATION
=============

Online documentation
--------------------

Manual pages:
- [Pkgfile.5](https://zeppe-lin.github.io/Pkgfile.5.html)
- [pkgmk.8](https://zeppe-lin.github.io/pkgmk.8.html)
- [pkgmk.conf.5](https://zeppe-lin.github.io/pkgmk.conf.5.html)
<!-- in progress
- [pkgmk.footprint.5](https://zeppe-lin.github.io/pkgmk.footprint.5.html)
- [pkgmk.md5sum.5](https://zeppe-lin.github.io/pkgmk.md5sum.5.html)
- [pkgmk.nostrip.5](https://zeppe-lin.github.io/pkgmk.nostrip.5.html)
-->


LICENSE
=======

pkgmk is licensed through the GNU General Public License v2 or later
<https://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
