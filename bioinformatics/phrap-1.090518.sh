#!/bin/bash

soft=phrap_crossmatch_swat
version=1.090518
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
cp distrib.tar.gz ${prefix}
cd ${prefix}
zcat distrib.tar.gz | tar xvf -
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## phrap_crossmatch_swat
set version 1.090518
proc ModulesHelp { } {
puts stderr "This module enables phrap, cross_match and swat tools"
puts stderr " "
}
module-whatis "Phrap, cross_match and swat"

set prefix /opt/bioinf/phrap_crossmatch_swat-${version}
prepend-path PATH ${prefix}
#EOF#
