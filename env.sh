#!/bin/sh
# This script is used to run radare2 from non-standard installed directory.
#
# Using:
#       % . ./env.sh /prefix/to/radare2 3.0.1-git
#       % r2 -V

if [ "$#" -lt 1 ]; then
  cat << EOF >&2
usage: . env.sh /prefix/to/radare2 <debug: on/off>
example:
    . env /opt/radare2/git
EOF
  return 1
fi

R2_PREFIX="${1}"
R2_SHARE_RADARE2="${R2_PREFIX}/share/radare2"
R2_GIT_MAGICPATH="$(find "${R2_SHARE_RADARE2}" -maxdepth 1 -path '*-git' | tail -n 1)"
R2_MAGICPATH="${R2_SHARE_RADARE2}/last/magic:${R2_GIT_MAGICPATH}"

MANPATH="${R2_PREFIX}/share/man"
LD_LIBRARY_PATH="${R2_PREFIX}/lib:${R2_PREFIX}/lib/x86_64-linux-gnu"
PATH="${R2_PREFIX}/bin:${PATH}"

if [ "${2}" = "on" ]; then
  CFLAGS="-I ${R2_PREFIX}/include/libr ${CFLAGS}"
  LDFLAGS="-L ${LD_LIBRARY_PATH} ${PATH}"
  export CFLAGS LDFLAGS
fi

export R2_MAGICPATH LD_LIBRARY_PATH MANPATH
