#!/bin/sh
git log "$(git describe --tags --abbrev=0 HEAD^)"..HEAD \
	--no-merges --pretty='%s (%h)' | awk '
BEGIN       { print "## [Unreleased]\n" } \
                                          \
/^feat/     { a=a "- " $0 ORS; next     } \
/^fix/      { b=b "- " $0 ORS; next     } \
/^docs/     { c=c "- " $0 ORS; next     } \
/^refactor/ { d=d "- " $0 ORS; next     } \
/^perf/     { e=e "- " $0 ORS; next     } \
            { f=f "- " $0 ORS           } \
                                          \
END         {                             \
              if (a) print "### Added\n"a;\
              if (b) print "### Fixed\n"b;\
              if (c) print "### Docs\n"c;\
              if (d) print "### Changed\n"d;\
              if (e) print "### Performance\n"e;\
              if (f) print "### Other\n"f;}'

