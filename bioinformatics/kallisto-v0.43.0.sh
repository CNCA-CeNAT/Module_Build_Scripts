#!/bin/bash

soft=kallisto_linux
version=v0.43.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
wget https://github.com/pachterlab/kallisto/releases/download/v0.43.0/kallisto_linux-v0.43.0.tar.gz
tar -xvzf kallisto_linux-v0.43.0.tar.gz
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## kallisto
set version v0.43.0
proc ModulesHelp { } {
puts stderr "This module enables kallisto"
puts stderr " "
}
module-whatis "kallisto"

set prefix /opt/bioinf/kallisto_linux-${version}
prepend-path PATH ${prefix}
#EOF#

