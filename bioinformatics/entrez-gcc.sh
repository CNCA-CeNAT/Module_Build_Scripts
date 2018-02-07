#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=entrez
version=git-gcc
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}/bin
curl ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.zip > edirect.zip
unzip edirect.zip
cd edirect
cp ./* ${prefix}/bin
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## ENTREZ
set version git-gcc
proc ModulesHelp { } {
puts stderr "This module enables ENTREZ tools"
puts stderr " "
}
module-whatis "ENTREZ Tools"

set prefix /opt/bioinf/entrez-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
