#!/bin/bash

soft=cufflinks
version=2.2.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${install}
wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz
tar -xvzf cufflinks-2.2.1.Linux_x86_64.tar.gz
mv cufflinks-2.2.1.Linux_x86_64 ${soft}-${version}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## cufflinks
set version 2.2.1
proc ModulesHelp { } {
puts stderr "This module enables cufflinks"
puts stderr " "
}
module-whatis "cufflinks"

set prefix /opt/bioinf/cufflinks-${version}

prepend-path PATH ${prefix}

#EOF#
