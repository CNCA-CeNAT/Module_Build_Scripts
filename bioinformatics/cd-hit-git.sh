#!/bin/bash
source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64


soft=cdhit
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $install


git clone https://github.com/weizhongli/cdhit.git cdhit-git
cd $prefix
make
make clean
cd cd-hit-auxtools
make 
make clean


mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sspace
set version git
proc ModulesHelp { } {
puts stderr "This module enables cd-hit"
puts stderr " "
}
module-whatis "CD-hit"

set prefix /opt/bioinf/cdhit-${version}

prepend-path PATH ${prefix}
prepend-path PATH ${prefix}/cd-hit-auxtools
#prepend-path PATH ${prefix}/bin
#EOF#
