#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=a5
version=20160825
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $install
wget https://superb-dca2.dl.sourceforge.net/project/ngopt/a5_miseq_linux_20160825.tar.gz
tar -xzf a5_miseq_linux_20160825.tar.gz 
mv a5_miseq_linux_20160825/ a5-20160825/
cd a5-20160825/

mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bedtools2
set version 20160825
proc ModulesHelp { } {
puts stderr "This module enables A5-miseq"
puts stderr " "
}
module-whatis "A5"

set prefix /opt/bioinf/a5-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
