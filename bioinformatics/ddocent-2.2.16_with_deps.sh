#!/bin/bash

soft=dDocent
version=2.2.16_with_deps
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
curl -L -O https://github.com/jpuritz/dDocent/archive/v2.2.16.tar.gz
tar -xvzf v2.2.16.tar.gz
mv ${soft}-2.2.16 ${soft}-${version}
mv ${soft}-${version} ${install}
cd $prefix
mkdir bin
bash install_dDocent_requirements ${prefix}/bin
cd $prefix
tar -xvzf pear-0.9.10-linux-x86_64.tar.gz
cp pear-0.9.10-linux-x86_64/bin/pear ${prefix}/bin/pearRM
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## dDocent
set version 2.2.16_with_deps
proc ModulesHelp { } {
puts stderr "This module enables dDocent"
puts stderr " "
}
module-whatis "dDocent"

set prefix /opt/bioinf/dDocent-${version}

prepend-path PATH ${prefix}
prepend-path PATH ${prefix}/bin
#EOF#
