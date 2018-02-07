#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=bioawk
version=git-gcc
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}/bin
git clone https://github.com/lh3/bioawk.git
cd $soft
make
cp $soft/$soft $prefix/bin
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bioawk
set version git-gcc
proc ModulesHelp { } {
puts stderr "This module enables bioawk tool"
puts stderr " "
}
module-whatis "Bioawk"

set prefix /opt/bioinf/bioawk-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
