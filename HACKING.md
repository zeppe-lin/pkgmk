HACKING
=======

This file attempts to describe the rules and notes to use when hacking
the pkgmk sources cloned from the Zeppe-Lin's source code repository.


Coding style
------------

  * Indent with tabs, align with spaces.

  * Variables declaration:

```
  +----------------+-------------------------------------------+
  | ${var}, ${VAR} | Global variable. External, declared in    |
  |                | sourced files like Pkgfile or pkgmk.conf. |
  +----------------+-------------------------------------------+
  | $VAR           | Internal, global variable.                |
  +----------------+-------------------------------------------+
  | $__VAR         | Local variable.                           |
  +----------------+-------------------------------------------+
```
