#!/bin/bash

soft=seqkit
version=0.7.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir ${prefix}
cd ${prefix}
wget https://github.com/shenwei356/seqkit/releases/download/v0.7.1-dev2/seqkit_linux_amd64.tar.gz
tar -xvzf seqkit_linux_amd64.tar.gz
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## seqkit
set version 0.7.1
proc ModulesHelp { } {
puts stderr "This module enables seqkit"
puts stderr " "
}
module-whatis "seqkit"

set prefix /opt/bioinf/seqkit-${version}
prepend-path PATH ${prefix}
#EOF#
