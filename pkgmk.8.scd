pkgmk(8) "version #VERSION#" "Package Manager Manual"

# NAME

pkgmk - make software package

# SYNOPSIS

*pkgmk* [options]

# DESCRIPTION

*pkgmk* is a _package management_ utility, which makes a software package.
A _package_ is an archive of files (.pkg.tar.gz, .pkg.tar.bz2 or .pkg.tar.xz)
that can be installed using *pkgadd*(8).

To prepare to use pkgmk, you must write a file named _Pkgfile_ that describes
how the package should be build.  See *Pkgfile*(5) for more details.  Once a
suitable _Pkgfile_ file exists, each time you change some source files, you
simply execute pkgmk to bring the package up to date.  The pkgmk program uses
the _Pkgfile_ file and the last-modification times of the source files to
decide if the package needs to be updated.

Global build configuration is stored in _/etc/pkgmk.conf_.  This file is read
by pkgmk at startup.

# OPTIONS

*-d*, *--download*
	Download missing source file(s).

*-do*, *--download-only*
	Do not build, only download missing source file(s).

*-utd*, *--up-to-date*
	Do not build, only check if the package is up to date.

*-uf*, *--update-footprint*
	Update footprint and treat last build as successful.

*-if*, *--ignore-footprint*
	Build package without checking footprint.

*-in*, *--ignore-new*
	Build package, ignore new files in a footprint mismatch.

*-um*, *--update-md5sum*
	Update md5sum using the current source files.

*-im*, *--ignore-md5sum*
	Build package without checking md5sum first.

*-cm*, *--check-md5sum*
	Check md5sum without building the package.

*-ns*, *--no-strip*
	Do not strip executable binaries or libraries.

*-f*, *--force*
	Build package even if it appears to be up to date.

*-c*, *--clean*
	Remove the (previously built) package and the downloaded source files.

*-kw*, *--keep-work*
	Keep temporary working directory.

*-cf*, *--config-file* <_FILE_>
	Use alternative configuration file (default is _/etc/pkgmk.conf_).

*-v*, *--version*
	Print version and exit.

*-h*, *--help*
	Print help and exit.

# FILES

Pkgfile
	Package build description.  See *Pkgfile*(5).

.footprint
	Package footprint (used for regression testing).

.md5sum
	MD5 checksum of source files.

/etc/pkgmk.conf
	Global package make configuration.  See *pkgmk.conf*(5).

aria2c
	Used by pkgmk to download source code (optional).

curl
	Used by pkgmk to download source code (optional).

wget
	Used by pkgmk to download source code (default).

# EXIT CODES

[[ 0
:< No error occured.
|  1
:  A general error has occured.
|  2
:  The Pkgfile is invalid.
|  3
:  The source or build directory is missing or is lacking read/write permissions.
|  4
:  An error occured during the download of source files.
|  5
:  An error occured during unpacking of source files.
|  6
:  MD5 checksum mismatch occured.
|  7
:  A footprint mismatch occured.
|  8
:  An error occured while running the build function.

# SEE ALSO

*pkgmk.conf*(5), *Pkgfile*(5), *pkgadd*(8), *pkgrm*(8), *pkginfo*(8), *rejmerge*(8)

# COPYRIGHT

Copyright (c) 2000-2005 Per Liden++
Copyright (c) 2006-2017 CRUX Team (https://crux.nu)

*pkgmk* is licensed through the GNU General Public License, read the COPYING
file for the complete license.

; End of file.
