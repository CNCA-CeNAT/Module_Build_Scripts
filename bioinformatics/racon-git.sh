#!/bin/bash

soft=racon
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/isovic/racon.git
cd ${soft}
make clean
make modules
make tools
make -j
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## SOAPdenovo2
set version git
proc ModulesHelp { } {
puts stderr "This module enables Racon"
puts stderr " "
}
module-whatis "Racon"

set prefix /opt/bioinf/Racon-${version}
prepend-path PATH ${prefix}
#EOF#
