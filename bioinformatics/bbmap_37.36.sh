#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=bbmap
version=37.36
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
curl -OL https://sourceforge.net/projects/bbmap/files/BBMap_37.36.tar.gz/download
tar -xvzf download
cd bbmap
cp -rf ./* $prefix
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bbmap
set version 37.36
proc ModulesHelp { } {
puts stderr "This module enables bbmap"
puts stderr " "
}
module-whatis "bbmap"

set prefix /opt/bioinf/bbmap-${version}

prepend-path PATH ${prefix}
#EOF#
