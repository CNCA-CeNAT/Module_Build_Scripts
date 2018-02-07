#!/bin/bash

soft=subread
version=1.5.1-source
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
wget http://sourceforge.net/projects/subread/files/subread-1.5.1/subread-1.5.1-source.tar.gz
tar -xvzf subread-1.5.1-source.tar.gz
cd subread-1.5.1-source/src
make -f Makefile.Linux
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## subread
set version 1.5.1-source
proc ModulesHelp { } {
puts stderr "This module enables subread"
puts stderr " "
}
module-whatis "subread"

set prefix /opt/bioinf/subread-${version}
prepend-path PATH ${prefix}/bin
#EOF#

