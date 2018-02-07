#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=emboss
version=gcc
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
wget ftp://emboss.open-bio.org/pub/EMBOSS/EMBOSS-6.6.0.tar.gz
tar -xvzf EMBOSS-6.6.0.tar.gz
cd EMBOSS-6.6.0
./configure --prefix=${install}/${soft}-6.6.0
make
make install
mkdir -p ${prefix}/bin
curl http://data.biostarhandbook.com/align/global-align.sh > ${prefix}/bin/global-align.sh
curl http://data.biostarhandbook.com/align/local-align.sh > ${prefix}/bin/local-align.sh
chmod +x ${prefix}/bin/*
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/6.6.0
#%Module#####################################################################
## EMBOSS
set version 6.6.0
proc ModulesHelp{} {
puts stderr "This module enables EMBOSS aligners"
puts stderr " "
}
module-whatis "EMBOSS aligners"

set prefix /opt/bioinf/emboss-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## EMBOSS
set version gcc
proc ModulesHelp { } {
puts stderr "This module enables EMBOSS aligners"
puts stderr " "
}
module-whatis "EMBOSS aligners"

set prefix /opt/bioinf/emboss-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#

