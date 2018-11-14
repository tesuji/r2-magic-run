#!/bin/sh
# This script is used to run radare2 from non-standard installed directory.
#
# Using:
#       % . ./env.sh /prefix/to/radare2 3.0.1-git
#       % r2 -V

if [ "$#" -lt 1 ]; then
  printf "usage: env.sh /prefix/to/radare2 <debug: on or off>\n" >&2
  return 1
fi

R2_PREFIX="${1}"  # maybe /opt/radare2/git
R2_MAGICPATH="${R2_PREFIX}/share/radare2/last/magic"
LD_LIBRARY_PATH="${R2_PREFIX}/lib"
PATH="${R2_PREFIX}/bin/:${PATH}"

export R2_MAGICPATH LD_LIBRARY_PATH

if [ "${2}" = "on" ]; then
  CFLAGS="-I ${R2_PREFIX}/include/libr ${CFLAGS}"
  LDFLAGS="-L ${LD_LIBRARY_PATH} ${PATH}"
  export CFLAGS LDFLAGS
fi
