#!/bin/bash

soft=datamash
version=1.2
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $src
wget http://ftp.gnu.org/gnu/datamash/datamash-1.2.tar.gz
tar -xvzf datamash-1.2.tar.gz
cd datamash-1.2
./configure --prefix=${prefix}
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## datamash
set version 1.2
proc ModulesHelp { } {
puts stderr "This module enables datamash"
puts stderr " "
}
module-whatis "datamash"

set prefix /opt/bioinf/datamash-${version}

prepend-path PATH ${prefix}/bin
prepend-path MANPATH ${prefix}/share/man

#EOF#
