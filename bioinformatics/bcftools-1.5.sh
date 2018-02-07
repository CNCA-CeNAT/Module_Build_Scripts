#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=bcftools
version=1.5
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget https://github.com/samtools/bcftools/releases/download/1.5/bcftools-1.5.tar.bz2
tar -xvjf bcftools-1.5.tar.bz2
cd bcftools-1.5
./configure --prefix=${prefix}
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bcftools
set version 1.5
proc ModulesHelp { } {
puts stderr "This module enables bbmap"
puts stderr " "
}
module-whatis "bcftools"

set prefix /opt/bioinf/bcftools-${version}

prepend-path PATH ${prefix}/bin
prepend-path MANPATH ${prefix}/share/man
#EOF#
