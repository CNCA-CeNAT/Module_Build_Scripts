#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=MaSuRCA
version=3.2.2
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $install
tar -xvzf MaSuRCA-3.2.2.tar.gz
cd ${soft}-${version}
./install.sh
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## masurca
set version git
proc ModulesHelp { } {
puts stderr "This module enables MaSuRCA"
puts stderr " "
}
module-whatis "MaSuRCA"

set prefix /opt/bioinf/MaSuRCA-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
