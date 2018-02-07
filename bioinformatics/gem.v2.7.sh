#!/bin/bash

soft=gem
version=v2.7
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}.${version}
cd ${install}
wget http://groups.csail.mit.edu/cgs/gem/download/gem.v2.7.tar.gz
tar -xvzf gem.v2.7.tar.gz
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## gem
set version v2.7
proc ModulesHelp { } {
puts stderr "This module enables gem"
puts stderr " "
}
module-whatis "gem"

set prefix /opt/bioinf/gem.${version}
prepend-path PATH ${prefix}
setenv gem ${prefix}/gem.jar
#EOF#

