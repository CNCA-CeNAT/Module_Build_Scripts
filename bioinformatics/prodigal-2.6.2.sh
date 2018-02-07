#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=Prodigal
version=2.6.2
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $install
mkdir -p ${prefix}/bin
wget https://github.com/hyattpd/Prodigal/archive/v2.6.2.tar.gz
tar -xvzf v2.6.2.tar.gz
cd Prodigal-2.6.2
make
mv prodigal ${prefix}/bin
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## prodigal
set version 2.6.2
proc ModulesHelp { } {
puts stderr "This module enables Prodigal"
puts stderr " "
}
module-whatis "Prodigal"

set prefix /opt/bioinf/Prodigal-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
