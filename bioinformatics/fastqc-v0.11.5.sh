#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=fastqc
version=v0.11.5
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}/bin
curl -O http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip
unzip fastqc_v0.11.5.zip
cd FastQC
chmod +x $soft
cp $soft ${prefix}/bin
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## FastQC
set version v0.11.5
proc ModulesHelp { } {
puts stderr "This module enables FastQC"
puts stderr " "
}
module-whatis "FastQC"

set prefix /opt/bioinf/fastqc-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
