#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=fasttree
version=2.1.10
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $install
mkdir ${soft}-${version}
cd ${soft}-${version}
wget http://www.microbesonline.org/fasttree/FastTree

mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## fasttree
set version 2.1.10
proc ModulesHelp { } {
puts stderr "This module enables FastTree"
puts stderr " "
}
module-whatis "FastTree"

set prefix /opt/bioinf/fasttree-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
