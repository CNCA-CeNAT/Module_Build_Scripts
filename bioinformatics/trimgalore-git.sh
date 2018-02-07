#!/bin/bash

soft=TrimGalore
version=0.4.3
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $install
curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.4.3.tar.gz -o trim_galore.tar.gz
tar xvzf trim_galore.tar.gz
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## TrimGalore
set version git
proc ModulesHelp { } {
puts stderr "This module enables TrimGalore"
puts stderr " "
}
module-whatis "TrimGalore"

set prefix /opt/bioinf/TrimGalore-${version}

prepend-path PATH ${prefix}
#EOF#
