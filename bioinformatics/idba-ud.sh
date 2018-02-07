#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=idba-ud
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $install
git clone https://github.com/loneknightpy/idba.git
cd idba
aclocal
autoconf
automake --add-missing
./configure --prefix=$prefix
make clean
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## idba-ud
set version git
proc ModulesHelp { } {
puts stderr "This module enables diamond"
puts stderr " "
}
module-whatis "idba tools"

set prefix /opt/bioinf/idba-ud-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
