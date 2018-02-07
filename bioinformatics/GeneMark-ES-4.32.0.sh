#!/bin/bash

. /opt/intel/bin/compilervars.sh intel64
soft=gm_et_linux_64.tar.gz
src=/opt/src
prefix=/opt/bioinf/$soft
cd $src
mkdir -p $prefix
wget --quiet http://topaz.gatech.edu/GeneMark/tmp/GMtool_p3kJb/gm_et_linux_64.tar.gz
tar -xvzf $soft.tar.gz
cd $soft
cp -rf gm_key /home/*/.gm_key
cp ./* ${prefix}
mkdir -p /opt/bioinf/modulefiles/GeneMarkET-ES

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/GeneMarkET-ES/4.32.0
#%Module#####################################################################
## netcdf-
set version 4.32.0
proc ModulesHelp { } {
puts stderr "This module enables the use of GeneMark ET/ES software"
puts stderr " "
}
module-whatis "GeneMarkET-ES"
set prefix /opt/bioinf/gm_et_linux_64
prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}:${prefix}/bin
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/GeneMarkET-ES/.modulerc
#%Module
if {![info exists gmes-done]} {
module-version gmes/4.32.0 4.32
module-version gmes/4.32 default
set gmes-done 1
}
#EOF#
