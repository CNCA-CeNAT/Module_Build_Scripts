#!/bin/bash

soft=Lighter
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/mourisl/Lighter.git
cd ${soft}

make clean
make -j
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## Lighter
set version git
proc ModulesHelp { } {
puts stderr "This module enables Lighter"
puts stderr " "
}
module-whatis "Lighter"

set prefix /opt/bioinf/Ligh-${version}
prepend-path PATH ${prefix}
#EOF#
