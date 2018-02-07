#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=quast
version=4.6.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget https://cytranet.dl.sourceforge.net/project/quast/quast-4.6.0.tar.gz
tar -xvzf quast-4.6.0.tar.gz
cd quast-4.6.0
sh ./install_full.sh

mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## quake
set version 4.6.0
proc ModulesHelp { } {
puts stderr "This module enables Quast"
puts stderr " "
}
module-whatis "Quast"

set prefix /opt/bioinf/quast-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
