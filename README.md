OVERVIEW
========

`pkgmk` is a package build utility that creates installable software
packages.

This project is a fork of CRUX `pkgmk` (part of `pkgutils`), starting
from commit 9ca0da6 (Sat Nov 17 2018), with the following key
differences:
  * POSIX `sh(1p)` (with `local` support) instead of `bash(1)`
  * Support of suckless `sbase`
  * Optional downloader support: `aria2c(1)` in addition to
    `curl(1)`/`wget(1)`
  * Manual pages in `scdoc(5)` format, including new ones:
    * `pkgmk.32bit(5)`
    * `pkgmk.Pkgfile(5)`
    * `pkgmk.footprint(5)`
    * `pkgmk.md5sum(5)`
    * `pkgmk.nostrip(5)`
  * Bash completion
  * Removed options: `-i`, `-u`, `-r`
  * Removed `signify(1)` support
  * GNU-style options, help, and usage
  * Support for `zstd`-compressed packages
  * Ability to rename downloaded tarballs
  * Ignore extended attributes when extracting tarballs
  * Configure archive formats for created packages

See git log for the full history.

Original sources: https://git.crux.nu/tools/pkgutils.git


REQUIREMENTS
============

Build-time
----------
  * POSIX `sh(1p)`, `make(1p)` and "mandatory utilities"
  * `scdoc(1)` for building manual pages

Runtime
-------
  * POSIX `sh(1p)` with "local" support and "mandatory utilities"
  * `sbase` or `coreutils`
  * GNU `diffutils`
  * GNU `findutils`
  * One of: `curl(1)`, `wget(1)`, `aria2c(1)` for download sources
  * `bsdtar(1)` for unpacking sources
  * `pkginfo(1)` (from `pkgutils`) for footprint checking/making


INSTALLATION
============

To install this package, run:

    make install

Configuration parameters are in `config.mk`.


DOCUMENTATION
=============

Manual pages are in `/man`.


LICENSE
=======

`pkgmk` is licensed through the GNU General Public License v2 or later
<https://gnu.org/licenses/gpl.html>.
See `COPYING` for license terms and `COPYRIGHT` for notices.
