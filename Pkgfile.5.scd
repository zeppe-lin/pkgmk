Pkgfile(5) "version #VERSION#" "Package Manager Manual"

# NAME

Pkgfile - build file for pkgmk

# DESCRIPTION

Pkgfile defines the build process of a source package.

# FILE FORMAT

The file is a *bash*(1) script, which defines a number of variables (_name_,
_version_, _release_ and _source_) and a function (_build_) that should be
executed in order to compile the package.

## Example

```
# Description: A library for demonstrating how to create package source
# URL:         http://www.gnu.org/software/somelib/index.html
# Depends on:  someotherlib coolness

name=somelib
version=1.2.3
release=1
source=(ftp://ftp.gnu.org/gnu/$name/$name-$version.tar.gz
        Makefile.in.patch)

build() {
        cd $name-$version

        patch -p1 -i ../Makefile.in.patch

        ./configure --prefix=/usr

        make V=1
        make DESTDIR=$PKG install

        rm -rf $PKG/usr/info
}
```

## General guidelines

The name of a package should always be lowercase (e.g. *name=eterm* and not
*name=Eterm*).  In case the package is added to the pkgsrc tree the exact same
name should be use for the name of the directory in the pkgsrc structure, i.e.
_/usr/pkgsrc/???/eterm_.

Do not combine several separately distributed programs/libraries into one
package.  Make several packages instead.

## Directories

In general packages should install files in these directories.  Exceptions are
of course allowed if there is a good reason.  But try to follow the following
directory structure as close as possible.

[[ /usr/bin/
:< User command/application binaries
|  /usr/sbin/
:  System binaries (e.g. daemons)
|  /usr/lib/
:  Libraries
|  /usr/include/
:  Header files
|  /usr/lib/<prog>/
:  Plug-ins, addons, etc
|  /usr/share/man/
:  Man pages
|  /usr/share/<prog>/
:  Data files
|  /usr/etc/<prog>/
:  Configuration files
|  /etc/
:  Configuration files for system software (daemons, etc)

_/opt_ directory is reserved for binary packages, manually compiled/installed
applications, etc.  Source-based packages should never place anything there.

_/usr/libexec/_ is not used, thus packages should never install anything there.
Use _/usr/lib/<prog>/_ instead.

## Junk files

Packages should not contain "junk files".  This includes info pages and other
online documentation, man pages excluded (e.g. usr/doc/\*, README, \*.info,
\*.html, etc).

Files related to NLS (national language support), always use *--disable-nls*
when available.

Useless or obsolete binaries (e.g. /usr/games/banner and /sbin/mkfs.minix).

## Variable names

Do not add new variables to the Pkgfile.  Only in very few cases does this
actually improve the readability or the quality of the package.  Further, the
only variables that are guaranteed to work with future versions of *pkgmk*(8)
are _name_, _version_, _release_ and _source_.  Other names could be in
conflict with internal variables in *pkgmk*(8).

Use the _$name_ and _$version_ variables to make the package easier to
update/maintain.  For example,

```
source=(http://xyz.org/$name-$version.tar.gz)
```

is better than

```
source=(http://xyz.org/myprog-1.0.3.tar.gz)
```

since the URL will automatically updated when you modify the _$version_
variable.

## Header

Provide a header including the following fields:

- Description : A short description of the package; keep it factual
- Maintainer  : Your full name and e-mail address, obfuscated if you want
- URL         : A webpage with more information on this software package
- Depends on  : A list of dependencies, separated either by spaces

"Depends on" can be omitted if there are no dependencies.

## Dependencies

Dependencies are supported by *pkgman*(8).  The following rules should be
respected:

- We list all runtime dependencies except for gcc (libstdc++) and glibc.
- _core_ contains essential packages for a system, and our scripts and source
  packages expect the programs provided by _core_ to be installed; this means
  that:
	- build dependencies provided by _core_ are not listed in the
	  dependency header
	- run-time dependencies from _core_ which aren't dynamically linked
	  in are not to be listed, either

Examples:

- *opt/sloccount* does *not* list _perl_, because the program is a perl script
  -- there's no binary that links to _libperl_
- *opt/libxml2* *does* list _zlib_, because _libxml_ is linked to _libz_.

The reasoning for this policy is that you can use *revdep*(1) to find packages
that need to be updated if one of the dependent libraries has become binary
incompatible.  To find out what libraries a binary is linked to, use *ldd*(1)
or *finddeps*(1).

## rc.d scripts

You can use the following template script for packages, that provide some sort
of daemon that should be runnable from a script called _$name.rc_, your package
installed to _/etc/rc.d/$name_.

```
#!/bin/sh -e
#
# /etc/rc.d/cron: start/stop cron(1) clock daemon
#

PIDFILE=/var/run/cron.pid

case $1 in
start)
        /usr/bin/cron
        ;;
stop)
        kill `cat $PIDFILE`
        ;;
restart)
        $0 stop ; sleep 2 ; $0 start
        ;;
*)
        echo "usage: $0 [start|stop|restart]"
        ;;
esac

# End of file.
```

The installation can happen by calling the following in your _build()_ function:

```
install -D -m 755 $SRC/$name.rc $PKG/etc/rc.d/$name
```

# ENVIRONMENT

The _build_ function should use the _$SRC_ variable whenever it needs to access
the files listed in the source variable, and the _$PKG_ variable as the root
destination of the output files.

Being a shell script executed in the context of *pkgmk*(8), the entire
_Pkgfile_ file has access to the variables initialized in *pkgmk.conf*(5) and
the default values set by *pkgmk*(8).  Also, as an undocumented side effect of
how it is used by *pkgmk*(8), it can also change the behaviour of *pkgmk*(8)
by rewriting some of its functions and variables while the current package is
built.  However, the _build_ function has only read access to these mentioned
above.

# ERRORS

Most of the command failures in _build()_ will stop the build process.  There
is no need to explicitly check the return codes.  If you need/want to handle a
command failure you should use constructs like:

```
if ! command...; then ...
	command || ...
```

# SEE ALSO

*pkgmk*(8), *pkgmk.conf*(5)

# COPYRIGHT

Copyright (c) 2000-2005 Per Liden++
Copyright (c) 2006-2018 CRUX team (https://crux.nu)

*pkgmk* is licensed through the GNU General Public License, read the COPYING
file for the complete license.

; End of file.











