#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=taxonkit
version=gcc
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}/bin
wget https://github.com/shenwei356/taxonkit/releases/download/v0.2.3/taxonkit_linux_amd64.tar.gz
tar -xvzf taxonkit_linux_amd64.tar.gz
mv taxonkit ${prefix}/bin
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## taxonkit
set version gcc
proc ModulesHelp { } {
puts stderr "This module enables taxonkit"
puts stderr " "
}
module-whatis "taxonkit"

set prefix /opt/bioinf/taxonkit-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
