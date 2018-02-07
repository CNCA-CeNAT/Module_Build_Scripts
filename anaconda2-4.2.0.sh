#!/bin/bash

soft=anaconda2
version=4.2.0
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}${version}
cd ${src}
wget -c https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
chmod +x Anaconda2-4.2.0-Linux-x86_64.sh
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## anaconda2
set version 2
proc ModulesHelp { } {
puts stderr "This module enables Anaconda 2"
puts stderr " "
}
module-whatis "Anaconda 2"

set prefix /opt/tools/anaconda${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
