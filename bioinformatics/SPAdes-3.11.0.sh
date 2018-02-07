#!/bin/bash

soft=SPAdes
version=3.11.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $src
wget http://spades.bioinf.spbau.ru/release3.11.0/SPAdes-3.11.0.tar.gz
tar -xvzf SPAdes-3.11.0.tar.gz
cd ${soft}-${version}
PREFIX=$prefix ./spades_compile.sh
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## SPAdes
set version 3.11.0
proc ModulesHelp { } {
puts stderr "This module enables SPAdes"
puts stderr " "
}
module-whatis "SPAdes"

set prefix /opt/bioinf/SPAdes-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
