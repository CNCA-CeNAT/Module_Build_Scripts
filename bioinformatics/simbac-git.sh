#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=simbac
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
git clone https://github.com/tbrown91/SimBac.git	

cd SimBac/
g++ *.cpp -lgsl -lgslcblas -lm -O2 -o SimBac	
cp simbac $prefix
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## simbac
set version git
proc ModulesHelp { } {
puts stderr "This module enables SimBac"
puts stderr " "
}
module-whatis "simbac"

set prefix /opt/bioinf/simbac-${version}

prepend-path PATH ${prefix}
#EOF#
