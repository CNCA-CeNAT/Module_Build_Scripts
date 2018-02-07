#!/bin/bash

soft=clustalx
version=2.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir -p ${prefix}
cd ${src}
wget http://www.clustal.org/download/current/clustalx-2.1-linux-i686-libcppstatic.tar.gz
tar -xvzf clustalx-2.1-linux-i686-libcppstatic.tar.gz
cd clustalx-2.1-linux-i686
./installer ${prefix}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## clustalx
set version 2.1
proc ModulesHelp { } {
puts stderr "This module enables Clustalx frontend"
puts stderr " "
}
module-whatis "Clustalx"

set prefix /opt/bioinf/clustalx-${version}
prepend-path PATH ${prefix}/bin
#EOF#
