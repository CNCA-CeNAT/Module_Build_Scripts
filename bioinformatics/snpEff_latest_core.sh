#!/bin/bash

soft=snpEff
version=core
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir -p ${prefix}
cd ${prefix}
curl -OL http://downloads.sourceforge.net/project/snpeff/snpEff_latest_core.zip
cd snpEff
unzip snpEff_latest_core.zip
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## snpEff_latest_core
set version core
proc ModulesHelp { } {
puts stderr "This module enables snpEff"
puts stderr " "
}
module-whatis "snpEff"

set prefix /opt/bioinf/snpEff-${version}
prepend-path PATH ${prefix}/snpEff
prepend-path PATH ${prefix}/clinEff
setenv snpEff ${prefix}/snpEff/snpEff.jar
setenv SnpSift ${prefix}/snpEff/SnpSift.jar
setenv ClinEff ${prefix}/snpEff/ClinEff.jar
#EOF#
