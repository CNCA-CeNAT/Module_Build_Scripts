#!/bin/bash

soft=seqtk
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/lh3/seqtk.git
cd seqtk
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## seqtk
set version git
proc ModulesHelp { } {
puts stderr "This module enables seqtk"
puts stderr " "
}
module-whatis "seqtk"

set prefix /opt/bioinf/seqyk
prepend-path PATH ${prefix}

#EOF#
