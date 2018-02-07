#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=prank
version=14.06.03
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget http://wasabiapp.org/download/prank/prank.linux64.140603.tgz
tar -C  $prefix prank.linux64.140603.tgz

mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## prank
set version 14.06.03
proc ModulesHelp { } {
puts stderr "This module enables PRANK"
puts stderr " "
}
module-whatis "prank"

set prefix /opt/bioinf/prank-${version}

prepend-path PATH ${prefix}/bin
#EOF#
