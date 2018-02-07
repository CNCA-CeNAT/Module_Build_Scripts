#!/bin/bash

soft=shovill
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
git clone https://github.com/tseemann/shovill.git
cd ${soft}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## procca
set version git
proc ModulesHelp { } {
puts stderr "This module enables Shovill"
puts stderr " "
}
module-whatis "Shovill"

set prefix /opt/bioinf/shovill-${version}
prepend-path PATH ${prefix}
#EOF#
