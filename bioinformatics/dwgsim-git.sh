#!/bin/bash

soft=dwgsim
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone --recursive https://github.com/nh13/DWGSIM dwgsim-git
cd dwgsim-git
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## dwgsim
set version git
proc ModulesHelp { } {
puts stderr "This module enables dwgsim"
puts stderr " "
}
module-whatis "dwgsim"

set prefix /opt/bioinf/dwgsim-${version}
prepend-path PATH ${prefix}
#EOF#
