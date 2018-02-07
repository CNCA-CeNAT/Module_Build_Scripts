#!/bin/bash

soft=hisat2
version=2.0.3-beta
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.0.3-beta-Linux_x86_64.zip
unzip hisat2-2.0.3-beta-Linux_x86_64.zip
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## hisat
set version 2.0.3-beta
proc ModulesHelp { } {
puts stderr "This module enables hisat"
puts stderr " "
}
module-whatis "hisat"

set prefix /opt/bioinf/hisat-${version}
prepend-path PATH ${prefix}
#EOF#

