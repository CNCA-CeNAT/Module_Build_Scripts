#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=sambamba
version=0.6.6
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget https://github.com/biod/sambamba/releases/download/v0.6.6/sambamba_v0.6.6_linux.tar.bz2
tar -xvjf sambamba_v0.6.6_linux.tar.bz2
cp sambamba_v0.6.6 $prefix/

mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sambamba
set version 0.6.6
proc ModulesHelp { } {
puts stderr "This module enables Sambamba"
puts stderr " "
}
module-whatis "sambamba"

set prefix /opt/bioinf/sambamba-${version}

prepend-path PATH ${prefix}
#EOF#
