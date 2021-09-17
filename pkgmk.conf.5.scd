pkgmk.conf(5) "version #VERSION#" "Package Manager Manual"

# NAME

pkgmk.conf - configuration file for pkgmk

# DESCRIPTION

*pkgmk.conf* file configures *pkgmk*(8).

# FILE FORMAT

The file consists of a number of variable assignments of the form
"option=value".  If some option is not used (commented out or not included in
the configuration file at all) pkgmk(8) will take a default action.

Comments can be specified by putting a hash (#) symbol as the
first character on the line.

# DIRECTIVES

## export CFLAGS='STRING'

Set C compiler options.++
Default: none.

## export CXXFLAGS='STRING'

Set C++ compiler options.++
Default: none.

## export JOBS='NUMBER'

Set the number of commands to run simultaneously when building a package.++
Default: none.

## export MAKEFLAGS='STRING'

Set make options.++
Default: none.

## PKGMK_SOURCE_MIRRORS=('STRING')

Set mirrors to check and download source archives from.++
Default: none.

## PKGMK_SOURCE_DIR='STRING'

Set directory for downloaded source archives.++
Default: directory of Pkgfile.

## PKGMK_PACKAGE_DIR='STRING'

Set directory for build packages.++
Default: directory of Pkgfile.

## PKGMK_WORK_DIR='STRING'

Set directory for building packages.++
Default: '_foo_/work', where _foo_ is the directory of the Pkgfile.

## PKGMK_LOCALPATCHES_DIR='STRING'

Set directory for local patches that aren't part of pkgsrc.

If it's desired to store any patches that should not be committed into
pkgsrc collections, they can be kept outside the pkgsrc tree in the
PKGMK_LOCALPATCHES_DIR directory.

The directory tree is expected to have directories with package name,
and arbitrarily named patch-files with suffix _.patch_ or _.diff_ that
are stored inside these directories.

For example, if you want to keep a private patch for the _png_ package,
keep it in PKGMK_LOCALPATCHES_DIR/_png_/patch.diff.

All files in the named directory will be applied with _-p1_ *patch*(1)
argument and before the Pkgfile's "build()" function.

Default: none.

## PKGMK_LOCALPATCHES_CMD='STRING'

Use specified command to apply local patches stored in _PKGMK_LOCALPATCHES_DIR_.

By default, patches are applied to all directories in _PKGMK_WORK_DIR/src_.
Since this directory contains most often only one directory (unpacked tarball) -
this is enough.  If the _PKGMK_WORK_DIR/src_ contains multiple directories,
there are several solutions:

- Use patches with full prefixes to extracted sources:

	```
	--- png-1.2.3/src/file.c
	+++ png-1.2.3/src/file.c
	```

	And the following command:

	```
	PKGMK_LOCALPATCHES_CMD="patch -r- --no-backup-if-mismatch -d \\
				$PKGMK_WORK_DIR/src -Np0"
	```

	This method is clean and elegant, but has disadvantages.  For example,
	with each new version of the package, you'll need to edit the patch.

- Use per/package setting.

	```
	case $name in
	pkgname1|pkgname2) PKGMK_LOCALPATCHES_CMD="..." ;;
	*) ;;
	esac
	```

Default: patch -r- --no-backup-if-mismatch -d "$PKGMK_WORK_DIR/src"/\*/ -Np1

## PKGMK_DOWNLOAD_PROG='STRING'

Use specified program to download source archives.  Valid strings are _aria2c_,
_curl_ and _wget_.

Default: wget.

## PKGMK_ARIA2C_OPTS='STRING'

Additional options for *aria2c*(1), which is used by *pkgmk*(8) to download all
files.++
Default: none.

## PKGMK_CURL_OPTS='STRING'

Additional options for *curl*(1), which is used by *pkgmk*(8) to download all
files.++
Default: none.

## PKGMK_WGET_OPTS='STRING'

Additional options for *wget*(1), which is used by *pkgmk*(8) to download all
files.++
Default: none.

## PKGMK_DOWNLOAD='(yes|no)'

If set to 'yes', *pkgmk*(8) will download the source archives if necessary.++
Default: no.

## PKGMK_IGNORE_FOOTPRINT='(yes|no)'

If set to 'yes', *pkgmk*(8) will not perform a footprint check of the build
package.++
Default: no.

## PKGMK_IGNORE_MD5SUM='(yes|no)'

If set to 'yes', *pkgmk*(8) will not perform a md5sum check of the source
archives.++
Default: no.

## PKGMK_IGNORE_NEW='(yes|no)'

If set to 'yes', *pkgmk*(8) will ignore new files in a footprint mismatch.++
Default: no.

## PKGMK_NO_STRIP='(yes|no)'

If set to 'no', *pkgmk*(8) will strip build binaries.++
Default: no.

## PKGMK_COMPRESSION_MODE='(gz|bz2|xz|lz)'

Option to select the mode used to compress the packages.++
Default: gz.

# SEE ALSO

*pkgmk*(8), *Pkgfile*(5)

# COPYRIGHT

Copyright (c) 2000-2005 Per Liden++
Copyright (c) 2006-2017 CRUX Team (https://crux.nu)

*pkgmk* is licensed through the GNU General Public License, read the COPYING
file for the complete license.

; End of file.
