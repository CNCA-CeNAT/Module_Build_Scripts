#!/bin/bash

soft=sickle
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/najoshi/sickle.git
mv ${soft} ${soft}-${version}
cd ${soft}-${version}
make clean
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sickle
set version git
proc ModulesHelp { } {
puts stderr "This module enables sickle"
puts stderr " "
}
module-whatis "sickle"

set prefix /opt/bioinf/sickle-${version}
prepend-path PATH ${prefix}
#EOF#
