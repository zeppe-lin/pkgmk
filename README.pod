pkgmk - make software package
=============================
pkgmk is a package management utility that makes a software package.
This directory contains pkgmk, a package management utility, which
makes a software package.

This pkgmk distribution is a fork of CRUX' pkgmk utility (which is
part of CRUX' pkgutils software) as of commit 9ca0da6 (Sat Nov 17
2018).  It was rewritten in POSIX sh(1) with suckless' sbase
compatibility.  Added support of aria2 downloader.  The man pages have
been rewritten in POD (Plain Old Documentation).  Added new man
page Pkgfile(5).  Added bash completion.  Options `-i`, `-u`, `-r`
have been removed.  The support of signify(1) was removed too, since
pkgsrc collection is distributed through git(1) with signed commits.


The original sources can be downloaded from:

  1.
    git clone git://crux.nu/tools/pkgutils.git
    git checkout 9ca0da6

  2. https://crux.nu/gitweb/?p=tools/pkgutils.git;a=summary


Dependencies
------------
Build time:
- make(1p) and standard POSIX utilities like mkdir(1p), cp(1p),
  rm(1p), sed(1p) and chmod(1p)
- podchecker(1pm) and pod2man(1pm) from perl distribution

Runtime:
- sh(1p) and standard POSIX utilities
- sbase or coreutils
- diffutils
- bsdtar(1)
- curl OR wget OR aria2 (for downloading the sources)


Install
-------
The shell commands `make; make install` should build and install this
package.  See `Makefile` for configuration parameters.


License and Copyright
---------------------
pkgmk is licensed through the GNU General Public License v2 or later
<https://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.


<!-- vim:ft=markdown:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
