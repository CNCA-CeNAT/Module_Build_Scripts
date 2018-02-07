#!/bin/bash

. /opt/intel/bin/compilervars.sh intel64
soft=skewer
src=/opt/src
prefix=/opt/bioinf/$soft
cd $src
mkdir -p $(prefix)/bin
git clone https://github.com/relipmoc/skewer.git
cd $soft
make
mv -f skewer $(prefix)/bin
mkdir -p /opt/bioinf/modulefiles/skewer

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/skewer/git
#%Module#####################################################################
## skewer
#set version 0.0.14
proc ModulesHelp { } {
puts stderr "This module enables the use of Skewer "
}
module-whatis "Skewer tools for NGS"
set prefix /opt/bioinf/skewer
prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/skewer/.modulerc
#%Module
if {![info exists skewer-done]} {
module-version skewer/git 2014
module-version skewer/2014 default
set skewer-done 1
}
#EOF#
