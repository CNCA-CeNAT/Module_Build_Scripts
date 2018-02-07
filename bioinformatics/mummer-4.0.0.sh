#!/bin/bash


soft=mummer
version=4.0.0beta1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $src
wget https://github.com/mummer4/mummer/releases/download/v4.0.0beta1/mummer-4.0.0beta1.tar.gz
tar -xvzf mummer-4.0.0.0beta1.tar.gz
cd ${soft}-${version}
PERL_EXT_PREFIX=/opt/tools/perl-5.26.0 ./configure --prefix=$prefix
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## mummer
set version 4.0.0beta1
proc ModulesHelp { } {
puts stderr "This module enables mummer"
puts stderr " "
}
module-whatis "mummer"

set prefix /opt/bioinf/mummer-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
