#!/bin/bash

soft=sspace
version=bc-longread-1.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
wget https://www.baseclear.com/base/download/40SSPACE-LongRead_v1-1.tar.gz
mv SSPACE-LongRead_v1-1/ baseclear-sspace-longread-1.1
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sspace
set version basic
proc ModulesHelp { } {
puts stderr "This module enables Baseclear SSpace longread"
puts stderr " "
}
module-whatis "Baseclear SSpace longread"

set prefix /opt/bioinf/baseclear-sspace-longread-${version}

prepend-path PATH ${prefix}
#EOF#
