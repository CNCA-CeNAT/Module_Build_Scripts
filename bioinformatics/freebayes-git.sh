#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=freebayes
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
git clone --recursive git://github.com/ekg/freebayes.git
cd freebayes
make
make
cp -rf ./bin/freebayes $prefix
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## freebayes
set version git
proc ModulesHelp { } {
puts stderr "This module enables freebayes"
puts stderr " "
}
module-whatis "freebayes"

set prefix /opt/bioinf/freebayes-${version}

prepend-path PATH ${prefix}
#EOF#
