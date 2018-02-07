#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=mrbayes
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $install
git clone https://github.com/NBISweden/MrBayes.git mrbayes-git
cd mrbayes-git
./configure --prefix=$prefix
make
make install
./configure --prefix=${install}/mrbayes-parallel --with-mpi=/opt/tools/mpich-3.2-gcc
make
make install
mv ${install}/mrbayes-parallel/bin/mb ${instlal}/mrbayes-parallel/bin/pmb
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## mrbayes
set version git
proc ModulesHelp { } {
puts stderr "This module enables MrBayes"
puts stderr " "
}
module-whatis "MrBayes"

set prefix /opt/bioinf/mrbayes-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path PATH /opt/bioinf/mrbayes-parallel/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
