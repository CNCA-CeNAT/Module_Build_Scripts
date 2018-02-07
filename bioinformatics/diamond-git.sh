#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=diamond
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $prefix
wget http://github.com/bbuchfink/diamond/releases/download/v0.9.10/diamond-linux64.tar.gz
tar -xvzf diamond-linux64.tar.gz
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## diamond
set version git
proc ModulesHelp { } {
puts stderr "This module enables diamond"
puts stderr " "
}
module-whatis "diamond"

set prefix /opt/bioinf/diamond-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
