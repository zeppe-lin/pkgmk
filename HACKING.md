HACKING
=======

This document outlines guidelines for working on `pkgmk`.


Commit Message Guidelines
-------------------------

We follow the [Conventional Commits](https://www.conventionalcommits.org/)
specification to keep history readable, searchable, and automatable.

**Format:**

```
<type>[: scope]: <short description>
```

- **type** — one of:
  - `feat` — new feature
  - `fix` — bug fix
  - `docs` — documentation only
  - `refactor` — code change that neither fixes a bug nor adds a feature
  - `perf` — performance improvement
  - `test` — adding or correcting tests
  - `chore` — maintenance, tooling, or build changes
- **scope** *(optional)* — affected module, script, or area
  (e.g. `pkgmk`, `docs`, `build`)
- **short description** — concise, imperative mood, no trailing period

**Examples:**

```
feat(pkgmk): support PKGMK_COMPRESSION_MODE override
fix(build): correct handling of PKGMK_IGNORE_NEW
docs(man): clarify PKGMK_KEEPWORK usage
```

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
