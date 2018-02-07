#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=varscan
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
git clone https://github.com/dkoboldt/varscan.git

chmod +x varscan/VarScan.v2.4.0.jar
cp -rf varscan/* ${prefix}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## trimmomatic
set version git
proc ModulesHelp { } {
puts stderr "This module enables VarScan"
puts stderr " "
}
module-whatis "Varscan"

set prefix /opt/bioinf/varscan-${version}
setenv varscan ${prefix}/VarScan.v2.4.0.jar
prepend-path CLASSPATH ${prefix}/VarScan.v2.4.0.jar
#EOF#
