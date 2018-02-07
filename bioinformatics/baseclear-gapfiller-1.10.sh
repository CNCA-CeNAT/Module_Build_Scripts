#!/bin/bash

soft=gapfiller
version=1.10
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
wget https://www.baseclear.com/base/download/39GapFiller_v1-10_linux-x86_64.tar.gz
tar -xvzf 39GapFiller_v1-10_linux-x86_64.tar.gz
mv GapFiller_v1-10_linux-x86_64 baseclear-gapfiller-1.10
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## gapfiller
set version 1.10
proc ModulesHelp { } {
puts stderr "This module enables gapfiller"
puts stderr " "
}
module-whatis "Gapfiller"

set prefix /opt/bioinf/baseclear-gapfiller-${version}

prepend-path PATH ${prefix}
#EOF#
