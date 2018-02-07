#!/bin/bash
#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=roary
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
#mkdir $prefix
cd $install
wget https://github.com/sanger-pathogens/Roary/tarball/master
tar zxvf sanger-pathogens-Roary-v3.11.0-0-g68c77ea.tar.gz
mv sanger-pathogens-Roary-68c77ea/ ${soft}-${version}/


mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## roary
set version git
proc ModulesHelp { } {
puts stderr "This module enables Roary"
puts stderr " "
}
module-whatis "Roary"

set prefix /opt/bioinf/roary-${version}

prepend-path PATH ${prefix}
prepend-path PATH ${prefix}/bin
prepend-path PERL5LIB ${prefix}/lib

#EOF#
