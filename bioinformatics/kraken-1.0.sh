#!/bin/bash

soft=kraken
version=1.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget https://ccb.jhu.edu/software/kraken/dl/kraken-1.0.tgz
tar -xvzf kraken-1.0.tgz
cd kraken-1.0
./install_kraken.sh ${prefix}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## kraken
set version 1.0
proc ModulesHelp { } {
puts stderr "This module enables kraken"
puts stderr " "
}
module-whatis "kraken"

set prefix /opt/bioinf/kraken-${version}

prepend-path PATH ${prefix}
#EOF#
