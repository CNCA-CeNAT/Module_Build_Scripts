#!/bin/bash

soft=mlst
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
git clone https://github.com/tseemann/mlst.git
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## mlst
set version git
proc ModulesHelp { } {
puts stderr "This module enables mlst"
puts stderr " "
}
module-whatis "mlst"

set prefix /opt/bioinf/abricate-${version}

prepend-path PATH ${prefix}
prepend-path PATH ${prefix}/bin
#EOF#
