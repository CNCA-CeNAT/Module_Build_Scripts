#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=FLASH
version=1.2.11
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
curl -OL https://downloads.sourceforge.net/project/flashpage/FLASH-1.2.11.tar.gz
tar -xvjf FLASH-1.2.11.tar.gz
make -j
cd ${soft}
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bwa
set version 0.7.15
proc ModulesHelp { } {
puts stderr "This module enables FLASH"
puts stderr " "
}
module-whatis "FLASH"

set prefix /opt/bioinf/FLASH-${version}

prepend-path PATH ${prefix}
#EOF#
