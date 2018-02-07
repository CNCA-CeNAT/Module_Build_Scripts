#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=trf
version=409
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}/bin
wget http://tandem.bu.edu/trf/downloads/trf409.linux64
chmod +x trf409.linux64
mv trf409.linux64 ${prefix}/bin/trf409
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## TRF
set version 409
proc ModulesHelp { } {
puts stderr "This module enables Tandem Repeats Finder"
puts stderr " "
}
module-whatis "Tandem Repeats Finder"

set prefix /opt/bioinf/trf-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
