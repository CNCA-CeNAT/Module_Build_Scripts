#!/bin/bash

soft=muscle
version=3.8.31
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $src
wget http://drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz
tar -xvzf muscle3.8.31_i86darlinux64.tar.gz
cd ${soft}-${version}


/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## vcftools
set version 3.8.31
proc ModulesHelp { } {
puts stderr "This module enables Muscle"
puts stderr " "
}
module-whatis "Muscle"

set prefix /opt/bioinf/muscle_${version}

prepend-path PATH ${prefix}/bin

#EOF#
