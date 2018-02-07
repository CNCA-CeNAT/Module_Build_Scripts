#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=blast+
version=2.7.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir -p $prefix
cd $src

wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.7.1+-src.tar.gz

tar -xvzf ncbi-blast-2.7.1+-src.tar.gz
cd ncbi-blast-2.7.1+-src/
cd c++
./configure
cd ReleaseMT/build
make all_r
 
mkdir -p ${module_path}
cp ${src}/ncbi-blast-2.7.1+-src/* ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bedtools2
set 2.7.1
proc ModulesHelp { } {
puts stderr "This module enables BLAST+"
puts stderr " "
}
module-whatis "BLAST+"

set prefix /opt/bioinf/blast+-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/c++/ReleaseMT/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
