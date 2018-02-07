#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=mafft
version=7.312
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
 wget https://mafft.cbrc.jp/alignment/software/mafft-7.312-with-extensions-src.tgz
 tar -zxvf mafft-7.312-with-extensions-src.tgz 
 mv mafft-7.312-with-extensions/ mafft-7.312/
 cd mafft-7.312/
./configure --prefix=$prefix
make 
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## mafft
set version 7.312
proc ModulesHelp { } {
puts stderr "This module enables mafft"
puts stderr " "
}
module-whatis "mafft"

set prefix /opt/bioinf/mafft-${version}

prepend-path PATH ${prefix}
#EOF#
