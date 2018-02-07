#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=trimmomatic
version=0.36
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
curl -O http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
unzip Trimmomatic-0.36.zip
chmod +x Trimmomatic-0.36/trimmomatic-0.36.jar
cp -rf Trimmmatic-0.36/* ${prefix}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## trimmomatic
set version 0.36
proc ModulesHelp { } {
puts stderr "This module enables trimmomatic"
puts stderr " "
}
module-whatis "Trimmomatic"

set prefix /opt/bioinf/trimmomatic-${version}
setenv trimmomatic ${prefix}/trimmomatic-0.36.jar
prepend-path CLASSPATH ${prefix}/trimmomatic-0.36.jar
#EOF#
