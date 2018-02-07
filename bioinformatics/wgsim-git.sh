#!/bin/bash

soft=wgsim
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/lh3/wgsim.git wgsim-git
cd wgsim-git
gcc -g -O2 -Wall -o wgsim wgsim.c -lz -lm
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## wgsim
set version git
proc ModulesHelp { } {
puts stderr "This module enables wgsim"
puts stderr " "
}
module-whatis "wgsim"

set prefix /opt/bioinf/wgsim-${version}
prepend-path PATH ${prefix}
#EOF#
