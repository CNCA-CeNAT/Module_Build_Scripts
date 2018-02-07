#!/bin/bash

soft=sspace
version=basic
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
git clone https://github.com/nsoranzo/sspace_basic.git
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sspace
set version basic
proc ModulesHelp { } {
puts stderr "This module enables SSpace basic"
puts stderr " "
}
module-whatis "SSpace"

set prefix /opt/bioinf/sspace_${version}

prepend-path PATH ${prefix}
prepend-path PATH ${prefix}/bin
#EOF#
