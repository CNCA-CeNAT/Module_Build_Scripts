#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=meraculous
version=v2.2.4
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $src
tar -xvzf Meraculous-v2.2.4.tar.gz
cd ${soft}-${version}
mkdir $prefix
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_BUILD_TYPE=Release -DCPERL=/opt/tools/perl-5.26.0/bin/perl -DCBoost_INCLUDE_DIR=/opt/libs/boost_1_65_0/include .. 
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## meraculous
set version v2.2.4
proc ModulesHelp { } {
puts stderr "This module enables Meraculous"
puts stderr " "
}
module-whatis "Meraculous"

set prefix /opt/bioinf/Meraculous-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
