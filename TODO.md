TODO pkgmk
==========


Next Release
------------

- [ ] Reflect `pkgman-readme(7)` & `pkgman-runscripts(7)` in pkgmk's
  manual pages?

- [ ] Document any exported to `pkgmk.conf` variables and functions,
  like `error()`, `$E_GENERAL`, etc? Where?

- [ ] Make packages' `.footprint` files kernel-version and
  architecture awarness?
  Like
  https://git.crux.nu/tools/pkgutils/commit/a7d4a0f64f12b967072a1ab10c690b3d55f14550
  This definitely need to be reflected in manual pages and handbook
  section of making packages.  Btw, don't rely on Tim's patch on
  implementing this feature.  He just replace X.Y.Z in the footprint,
  which may correspond to kernel version, but may not.  "Handle
  kernel-version better", lol.


No milestone
------------

- [ ] rework command-line options? add `--compress-format <format>`
  option?  Note that these changes need update pkgman's manual pages.

- [ ] add support of sha256 checksums `.sha256sum`?  Make priorities?
  Check all sum-files if exist more than one?

- [ ] Pkgmk checks of directory permissions are too strict:
  https://github.com/zeppe-lin/pkgmk/issues/4

- [ ] Add pigz support for parallel compression to gzip?
  https://github.com/zeppe-lin/pkgmk/issues/1

- [ ] Colorize "footprint mismatch" messages like `diff(1)` does?


Done
----

- [x] Document `.nostrip` files:
  https://github.com/zeppe-lin/pkgmk/issues/5
  Done via pkgmk.nostrip(5).

- [x] Document `.md5sum` files.
  Done via pkgmk.md5sum(5).

- [x] Document `PKGMK_ARCH`.
  Done via pkgmk.32bit(5).

- [x] Reflect new manual pages in the handbook.

- [x] Refine new manual pages.  Look how well they link to each other.

