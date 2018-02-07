#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=bwa
version=14.137
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
 wget http://www.micans.org/mcl/src/mcl-14-137.tar.gz
 tar -zxvf mcl-14-137.tar.gz && cd mcl-14-137
./configure --prefix=$prefix
make 
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bwa
set version 14.137
proc ModulesHelp { } {
puts stderr "This module enables MCL"
puts stderr " "
}
module-whatis "mcl"

set prefix /opt/bioinf/mcl-${version}

prepend-path PATH ${prefix}
#EOF#
