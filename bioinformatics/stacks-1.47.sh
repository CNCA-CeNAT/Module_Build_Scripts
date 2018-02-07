#!/bin/bash

module load gcc/4.9.4

soft=stacks
version=1.47
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $src
wget http://catchenlab.life.illinois.edu/stacks/source/stacks-1.47.tar.gz
tar -xvzf stacks-1.47.tar.gz
cd ${soft}-${version}
./configre --prefix=$prefix --with-sparsehash-include-path=/opt/tools/sparsehash-git/include
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## Stacks
set version 1.47
proc ModulesHelp { } {
puts stderr "This module enables Stacks"
puts stderr " "
}
module-whatis "Stacks"

set prefix /opt/bioinf/stacks-${version}


prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
