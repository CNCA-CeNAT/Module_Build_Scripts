#!/bin/bash

soft=gubbins
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
git clone https://github.com/sanger-pathogens/gubbins.git gubbins-git
autoreconf -i
./configure
make
make install
cd python
python3 setup.py install

mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sspace
set version git
proc ModulesHelp { } {
puts stderr "This module enables gubbins"
puts stderr " "
}
module-whatis "Gubbins"

set prefix /opt/bioinf/gubbins-${version}

prepend-path PATH ${prefix}
#prepend-path PATH ${prefix}/bin
#EOF#
