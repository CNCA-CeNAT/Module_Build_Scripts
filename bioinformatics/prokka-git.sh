#!/bin/bash

soft=procca
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/tseemann/prokka.git
cd ${soft}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## procca
set version git
proc ModulesHelp { } {
puts stderr "This module enables Procca"
puts stderr " "
}
module-whatis "Procca"

set prefix /opt/bioinf/procca-${version}
prepend-path PATH ${prefix}
#EOF#
