#!/bin/bash

soft=cfsan-sns
version=pip
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## cfsan
set version git
proc ModulesHelp { } {
puts stderr "This module enables CFSAN SNP pipeline "
puts stderr " "
}
module-whatis "CFSAN SNP"




prepend-path CLASSPATH /opt/bioinf/picard-2.11.0/picard.jar
prepend-path CLASSPATH /opt/bioinf/varscan-git/VarScan.v2.4.0.jar

#EOF#
