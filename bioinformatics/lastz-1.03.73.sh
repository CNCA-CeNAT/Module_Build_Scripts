#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=lastz
version=1.03.73
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
curl -O http://www.bx.psu.edu/~rsharris/lastz/newer/lastz-1.03.73.tar.gz
tar -xvzf lastz-1.03.73.tar.gz
cd lastz-distrib-1.03.73
make
cp src/lastz ${prefix}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## lastz
set version 1.03.73
proc ModulesHelp { } {
puts stderr "This module enables lastz"
puts stderr " "
}
module-whatis "lastz"

set prefix /opt/bioinf/lastz-${version}

prepend-path PATH ${prefix}
#EOF#
