ABOUT
-----
This directory contains *pkgmk*, a package management utility that
makes a software package.

This *pkgmk* distribution is a fork of CRUX' *pkgmk* utility (which is
part of CRUX' *pkgutils* software) as of commit 9ca0da6
(Sat Nov 17 2018) with the following differences:

  * rewritten in POSIX sh(1p)
  * added support of suckless' sbase utilities
  * added support of aria2c(1) downloader
  * the man pages have been rewritten in POD format
  * added Pkgfile(5) man page
  * added bash completion
  * removed "-i", "-u", and "-r" command-line options
  * removed signify(1) support since pkgsrc collection is
    distributed through git(1) with signed commits
  * added GNU-style long options
  * refactored options parsing

See git log for complete/further differences.

The original sources can be downloaded from:
  1. git://crux.nu/tools/pkgutils.git                        (git)
  2. https://crux.nu/gitweb/?p=tools/pkgutils.git;a=summary  (web)

REQUIREMENTS
------------
Build time:
  * POSIX sh(1p), make(1p) and "mandatory utilities"
  * pod2man(1pm) to build man pages

Runtime:
  * POSIX sh(1p) and "mandatory utilities"
  * sbase or coreutils
  * GNU diffutils
  * GNU findutils
  * curl(1) or wget(1) or aria2c(1) to download sources
  * bsdtar(1) or tar(1) to unpack sources

Tests:
  * podchecker(1pm) to check PODs for errors
  * curl(1) to check URLs for response code

INSTALL
-------
The shell commands `make && make install` should build and install
this package.

The shell command `make check` should start some tests.

LICENSE
-------
*pkgmk* is licensed through the GNU General Public License v2 or
later <https://gnu.org/licenses/gpl.html>.
Read the *COPYING* file for copying conditions.
Read the *COPYRIGHT* file for copyright notices.

<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
