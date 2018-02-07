#!/bin/bash

soft=sspace
version=3.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
wget https://www.baseclear.com/base/download/41SSPACE-STANDARD-3.0_linux-x86_64.tar.gz
tar -xvzf 41SSPACE-STANDARD-3.0_linux-x86_64.tar.gz
mv SSPACE-STANDARD-3.0_linux-x86_64 baseclear-sspace-standar-3.0
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sspace
set version 3.0
proc ModulesHelp { } {
puts stderr "This module enables Baseclear SSpace, bowtie, bwa and other tools"
puts stderr " "
}
module-whatis "Baseclear SSpace. Please load perl module before using"

set prefix /opt/bioinf/baseclear-sspace-standard-${version}

prepend-path PATH ${prefix}/bowtie
prepend-path PATH ${prefix}/bin
prepend-path PATH ${prefix}/bwa
prepend-path PATH ${prefix}/dotlib
prepend-path PATH ${prefix}/tools
#EOF#
