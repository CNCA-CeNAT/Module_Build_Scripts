#!/bin/bash

soft=SOAPdenovo2
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/aquaskyline/SOAPdenovo2.git
cd ${soft}
make clean
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## SOAPdenovo2
set version git
proc ModulesHelp { } {
puts stderr "This module enables SOAPdenovo2"
puts stderr " "
}
module-whatis "SOAPdenovo2"

set prefix /opt/bioinf/SOAPdenovo2-${version}
prepend-path PATH ${prefix}
#EOF#
