#!/bin/bash

soft=minia
version=2.0.7
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
wget https://github.com/GATB/minia/releases/download/v2.0.7/minia-v2.0.7-bin-Linux.tar.gz
tar -xvzf minia-v2.0.7-bin-Linux.tar.gz
mv minia-v2.0.7-bin-Linux minia-2.0.7
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## minia
set version 2.0.7
proc ModulesHelp { } {
puts stderr "This module enables minia"
puts stderr " "
}
module-whatis "minia"

set prefix /opt/bioinf/minia-${version}

prepend-path PATH ${prefix}/bin
#EOF#
