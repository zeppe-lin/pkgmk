HACKING
=======

This document outlines guidelines for working on `pkgmk`.


Coding style
------------

* **Identation**: Use tabs; use spaces only for alignment.

* **Line length**: Aim for ~71 columns in code.  Help/usage text must
  fit within 79 columns.

* **Variable naming**:
  * `${var}`, `${VAR}` -> external globals (declared in sourced files
    like `Pkgfile` or `pkgmk.conf`)
  * `$VAR` -> internal globals
  * `$__var` -> locals


Documentation
-------------

* Check manual pages for misspells: `hunspell -l man/*.scdoc`
