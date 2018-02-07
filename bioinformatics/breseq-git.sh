#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=breseq
version=0.31.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $install
wget https://github.com/barricklab/breseq/releases/download/0.31.0/breseq-0.31.0-Linux-x86_64.tar.gz
tar -xzf breseq-0.31.1-Source.tar.gz 
mv breseq-0.31.0-Linux-x86_64/ breqseq-0.31.0/
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## breseq
set version 0.31.0
proc ModulesHelp { } {
puts stderr "This module enables Breseq"
puts stderr " "
}
module-whatis "Breseq"

set prefix /opt/bioinf/breseq-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
