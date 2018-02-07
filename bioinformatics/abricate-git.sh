#!/bin/bash

soft=abricate
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
git clone https://github.com/tseemann/abricate.git
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sspace
set version git
proc ModulesHelp { } {
puts stderr "This module enables ABRicate"
puts stderr " "
}
module-whatis "ABRicate"

set prefix /opt/bioinf/abricate-${version}

prepend-path PATH ${prefix}
prepend-path PATH ${prefix}/bin
#EOF#
