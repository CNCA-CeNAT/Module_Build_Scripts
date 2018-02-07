#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=solctra
version=git
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}/bin
git clone https://wivill@gitlab.com/ldcl289/solctra.git
cd ${soft}
make mpi-icpc-knl
cp solctra ${prefix}/bin
cp solctra.knl ${prefix}/bin
cp submit.pbs ${prefix}/bin
cp submit.sh ${prefix}/bin
cp submit.sh.knl ${prefix}/bin
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## Solctra
set version git
proc ModulesHelp { } {
puts stderr "This module enables using SOLCTRA tools"
puts stderr " "
}
module-whatis "SOLCTRA"

set prefix /opt/tools/solctra-${version}

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#
/bin/cat <<"#EOF#" > ${module_path}/.modulerc
#%Module
if {![info exists nw-done]} {
module-version solctra/git default
set nw-done 1
}
#EOF#
