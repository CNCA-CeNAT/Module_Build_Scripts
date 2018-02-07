#!/bin/bash

soft=kmergenie
version=1.7044
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
wget http://kmergenie.bx.psu.edu/kmergenie-1.7044.tar.gz
tar -xvzf kmergenie-1.7044.tar.gz
cd kmergenie-1.7044
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## kmergenie
set version 1.7044
proc ModulesHelp { } {
puts stderr "This module enables kmergenie"
puts stderr " "
}
module-whatis "kmergenie"

set prefix /opt/bioinf/kmergenie-${version}

prepend-path PATH ${prefix}
#EOF#
