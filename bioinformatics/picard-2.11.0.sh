#!/bin/bash

soft=picard
version=2.11.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
mkdir ${prefix}
cd ${prefix}
wget https://github.com/broadinstitute/picard/releases/download/2.11.0/picard.jar
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## gem
set version 2.11.0
proc ModulesHelp { } {
puts stderr "This module enables picard tools"
puts stderr " "
}
module-whatis "picard tools"

set prefix /opt/bioinf/picard-${version}
prepend-path PATH ${prefix}
setenv picard ${prefix}/picard.jar
#EOF#

