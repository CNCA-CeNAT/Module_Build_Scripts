#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=bwa
version=0.7.15
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
curl -OL http://sourceforge.net/projects/bio-bwa/files/bwa-0.7.15.tar.bz2
tar -xvjf bwa-0.7.15.tar.bz2
cd bwa-0.7.15
make
cp bwa $prefix
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bwa
set version 0.7.15
proc ModulesHelp { } {
puts stderr "This module enables bwa"
puts stderr " "
}
module-whatis "bwa"

set prefix /opt/bioinf/bwa-${version}

prepend-path PATH ${prefix}
#EOF#
