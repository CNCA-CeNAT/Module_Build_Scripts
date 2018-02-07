#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=charm
version=6.7.1
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget --quiet http://charm.cs.illinois.edu/distrib/charm-6.7.1.tar.gz
tar -xvzf ${soft}-6.7.1.tar.gz
cd ${soft}-${version}
./build LIBS netlrts-linux-x86_64 gcc --build-shared -optimize 
./build LIBS netlrts-linux-x86_64 icc --build-shared -optimize  
./build LIBS mpi-linux-x86_64 --with-production
./build LIBS mpi-linux-x86_64   
./build LIBS multicore-linux-x86_64  --build-shared -optimize  
./build LIBS multicore-linux-x86_64  --build-shared -optimize  
mv netlrts* ${prefix}/
mv mpi* ${prefix}/
mv multicore* ${prefix}/
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}-netlrts-gcc
#%Module#####################################################################
## charm++ LIBS udp gcc netlrts
set version 6.7.1
proc ModulesHelp { } {
puts stderr "This module enables using charm++"
puts stderr "Compiled with the following options: "
puts stderr "netlrts-linux-x86_64 gcc --build-shared -optimize --enable-charmdebug"

}
module-whatis "Charm++"

set prefix /opt/tools/charm++-${version}/netlrts-linux-x86_64-gcc

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/${version}-netlrts-icc
#%Module#####################################################################
## charm++ LIBS udp icc netlrts
set version 6.7.1
proc ModulesHelp { } {
puts stderr "This module enables using charm++"
puts stderr "Compiled with the following options: "
puts stderr "netlrts-linux-x86_64 icc --build-shared -optimize --enable-charmdebug"

}
module-whatis "Charm++"

set prefix /opt/tools/charm++-${version}/netlrts-linux-x86_64-icc

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/${version}-mpi-gcc
#%Module#####################################################################
## charm++ LIBS udp mpi netlrts
set version 6.7.1
proc ModulesHelp { } {
puts stderr "This module enables using charm++"
puts stderr "Compiled with the following options: "
puts stderr "mpi-linux-x86_64 gcc --build-shared -optimize --enable-charmdebug"

}
module-whatis "Charm++"

set prefix /opt/tools/charm++-${version}/mpi-linux-x86_64-gcc

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/${version}-mpi-icc
#%Module#####################################################################
## charm++ LIBS udp icc netlrts
set version 6.7.1
proc ModulesHelp { } {
puts stderr "This module enables using charm++"
puts stderr "Compiled with the following options: "
puts stderr "mpi-linux-x86_64 icc --build-shared -optimize --enable-charmdebug"

}
module-whatis "Charm++"

set prefix /opt/tools/charm++-${version}/mpi-linux-x86_64-icc

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/${version}-multicore-gcc
#%Module#####################################################################
## charm++ LIBS udp gcc netlrts
set version 6.7.1
proc ModulesHelp { } {
puts stderr "This module enables using charm++"
puts stderr "Compiled with the following options: "
puts stderr "multicore-linux-x86_64 gcc --build-shared -optimize --enable-charmdebug"

}
module-whatis "Charm++"

set prefix /opt/tools/charm++-${version}/multicore-linux-x86_64-gcc

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/${version}-multicore-icc
#%Module#####################################################################
## charm++ LIBS udp icc netlrts
set version 6.7.1
proc ModulesHelp { } {
puts stderr "This module enables using charm++"
puts stderr "Compiled with the following options: "
puts stderr "multicore-linux-x86_64 icc --build-shared -optimize --enable-charmdebug"

}
module-whatis "Charm++"

set prefix /opt/tools/charm++-${version}/multicore-linux-x86_64-icc

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#
