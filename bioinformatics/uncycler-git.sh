#!/bin/bash

soft=Unicycler
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/rrwick/Unicycler.git
cd ${soft}

make clean
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## Unicycler
set version git
proc ModulesHelp { } {
puts stderr "This module enables Unicycler"
puts stderr " "
}
module-whatis "Unicycler"

set prefix /opt/bioinf/Unicycler-${version}
prepend-path PATH ${prefix}
#EOF#
