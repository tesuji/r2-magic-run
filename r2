#!/bin/sh
# This script is used to run radare2 from non-standard installed directory.
#
# In specific, first I extracted the radare2 package by:
#
#       % wget -O 'radare2.deb' 'http://radare.mikelloc.com/get/2.9.0/radare2_2.9.0_amd64.deb'
#       % dpkg -x 'radare2.deb' "${HOME}/builddir/radare2"
#
# In your case, you need to modify the extracted directory and R2_PREFIX
# below correctly.
BIN_NAME="$(basename "$0")"
R2_PREFIX="${HOME}/builddir/radare2/usr"
R2_MAGICPATH="${R2_PREFIX}/share/radare2/2.9.0/magic"
LD_LIBRARY_PATH="${R2_PREFIX}/lib/"
BIN_PATH="${R2_PREFIX}/bin/${BIN_NAME}"

export R2_MAGICPATH LD_LIBRARY_PATH
exec "${BIN_PATH}" "$@"
