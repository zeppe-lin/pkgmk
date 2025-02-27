HACKING
=======

This file attempts to describe the rules and notes to use when hacking
the pkgmk sources cloned from the Zeppe-Lin's source code repository.


Coding style
------------

* Indent with tabs, align with spaces.

* Maintain a 71-column limit for code where possible, and enforce a
  strict 79-column limit for the formatted output messages, such as
  usage, help, etc.

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


Documentation
-------------

* Generate online references to the manual pages in README.md from Vim:

```
:r!ls *.[0-9] | sed 's/^man\/\(.*\)/- \[\1\]\(https:\/\/zeppe-lin.github.io\/\1.html\)/g'
```
