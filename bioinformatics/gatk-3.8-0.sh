#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=gatk
version=3.8-0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
tar -xvjf GenomeAnalysisTK-3.8-0.tar.bz2
cd GenomeAnalysisTK-3.8-0-ge9d806836
cp -rf ./* $prefix
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bbmap
set version 3.8-0
proc ModulesHelp { } {
puts stderr "This module enables GATK"
puts stderr " "
}
module-whatis "GATK"

set prefix /opt/bioinf/gatk-${version}
prepend-path PATH ${prefix}
setenv gatk ${prefix}/GenomeAnalysisTK.jar
#EOF#
