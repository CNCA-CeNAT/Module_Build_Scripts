#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=jellyfish
version=2.2.7
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $install
wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.7/jellyfish-2.2.7.tar.gz
tar -xzf jellyfish-2.2.7.tar.gz
cd jellyfish-2.2.7
./configure --prefix=$prefix
make clean
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## jellyfish
set version 2.2.7
proc ModulesHelp { } {
puts stderr "This module enables Jellyfish"
puts stderr " "
}
module-whatis "Jellyfish"

set prefix /opt/bioinf/jellyfish-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
