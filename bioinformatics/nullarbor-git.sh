#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=nullarbor
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
mkdir $prefix/src
cd $src
wget https://ccb.jhu.edu/software/kraken/dl/minikraken.tgz
tar $prefix/src -C -zxvf minikraken.tgz
git clone https://github.com/tseemann/nullarbor.git
cp nullarbor/* ${prefix}/
cd ${soft}-${version}/bin
#testing
#nullarbor.pl --name PROJNAME --mlst saureus --ref US300.fna --input samples.tab --outdir OUTDIR
#nice make -j 4 -C OUTDIR
#cd OUTDIR
#make -j 4


mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## breseq
set version git
proc ModulesHelp { } {
puts stderr "This module enables Nullarbor"
puts stderr " "
}
module-whatis "Nullarbor"

set prefix /opt/bioinf/nullarbor-${version}

#prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
#prepend-path LIBRARY_PATH ${prefix}/lib
#prepend-path LD_LIBRARY_PATH ${prefix}/lib
#prepend-path MANPATH ${prefix}/share/man
#EOF#
