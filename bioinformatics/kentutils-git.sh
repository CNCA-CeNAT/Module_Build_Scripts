#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=kentUtils
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
git clone https://github.com/ENCODE-DCC/kentUtils.git
cd $soft
make
cp -r bin ${prefix}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## Kent Utils
set version git
proc ModulesHelp { } {
puts stderr "This module enables Kent Utils for bioinformatics"
puts stderr " "
}
module-whatis "Kent Utils"

set prefix /opt/bioinf/kentUtils-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
