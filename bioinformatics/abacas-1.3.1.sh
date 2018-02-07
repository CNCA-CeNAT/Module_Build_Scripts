#!/bin/bash

soft=abacas
version=1.3.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $src

wget https://superb-dca2.dl.sourceforge.net/project/abacas/abacas.1.3.1.pl

mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## Abacas
set version 3.11.0
proc ModulesHelp { } {
puts stderr "This module enables Abacas"
puts stderr " "
}
module-whatis "abacas"

set prefix /opt/bioinf/abacas-${version}
prepend-path PATH ${prefix}


#EOF#
