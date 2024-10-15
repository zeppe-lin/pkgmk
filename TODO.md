TODO pkgmk
==========


Next Release
------------
  - [ ] Document `.nostrip` files:
        https://github.com/zeppe-lin/pkgmk/issues/5
        May be need to reflect this change to `handbook(7)` too?

  - [ ] Document `.md5sum` files.

  - [ ] Document `PKGMK_ARCH` and other exported to `pkgmk.conf` variables and
        functions.

  - [ ] Make packages' `.footprint` files kernel-version and architecture awarness?
        Like https://git.crux.nu/tools/pkgutils/commit/a7d4a0f64f12b967072a1ab10c690b3d55f14550
        This definitely need to be reflected in manual pages and handbook
        section of making packages.
        Btw, don't rely on Tim's patch on implementing this feature.  He just
        replace X.Y.Z in the footprint, which may correspond to kernel version,
        but may not. "Handle kernel-version better", lol.


No milestone
------------
  - [ ] Pkgmk checks of directory permissions are too strict:
        https://github.com/zeppe-lin/pkgmk/issues/4

  - [ ] Add pigz support for parallel compression to gzip?
        https://github.com/zeppe-lin/pkgmk/issues/1

  - [ ] Colorize "footprint mismatch" messages like `diff(1)` does?
