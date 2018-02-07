#!/bin/bash

soft=megahit
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/voutcn/megahit.git megahit-git
cd megahit-git
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## megahit
set version git
proc ModulesHelp { } {
puts stderr "This module enables megahit"
puts stderr " "
}
module-whatis "megahit"

set prefix /opt/bioinf/megahit-${version}
prepend-path PATH ${prefix}
#EOF#
