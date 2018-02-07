#!/bin/bash

soft=tophat
version=2.1.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz
tar -xvzf tophat-2.1.1.Linux_x86_64.tar.gz
mv tophat-2.1.1.Linux_x86_64 ${soft}-${version}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## tophat
set version 2.1.1
proc ModulesHelp { } {
puts stderr "This module enables tophat"
puts stderr " "
}
module-whatis "tophat"

set prefix /opt/bioinf/tophat-${version}

prepend-path PATH ${prefix}
#EOF#
