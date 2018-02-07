#!/bin/bash

soft=mothur
version=1.39.5
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
wget https://github.com/mothur/mothur/releases/download/v1.39.5/Mothur.linux_64.zip
unzip Mothur.linux_64.zip
mv mothur mothur-1.39.5
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## mothur
set version 1.39.5
proc ModulesHelp { } {
puts stderr "This module enables mothur"
puts stderr " "
}
module-whatis "mothur"

set prefix /opt/bioinf/mothur-${version}

prepend-path PATH ${prefix}
#EOF#
