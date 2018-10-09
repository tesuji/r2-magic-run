#!/bin/sh
# This script is used to run radare2 from non-standard installed directory.
#
# In specific, first I extracted the radare2 package by:
#
#       dpkg -x radare2.deb ${HOME}/builddir/radare2
#
# In your case, you need to modify the extracted directory and R2_PREFIX
# below correctly.
bin=$(basename "$0")
R2_PREFIX=${HOME}/builddir/radare2/usr
R2_MAGICPATH=${R2_PREFIX}/share/radare2/2.9.0/magic
LD_LIBRARY_PATH=${R2_PREFIX}/lib/

export R2_MAGICPATH LD_LIBRARY_PATH
"${R2_PREFIX}/bin/${bin}" "$@"
