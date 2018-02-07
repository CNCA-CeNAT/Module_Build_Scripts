#!/bin/bash

. /opt/intel/bin/compilervars.sh intel64
soft=RepeatScout-1.0.5
src=/opt/src
prefix=/opt/bioinf/$soft
cd $src
mkdir -p $prefix
wget --quiet http://bix.ucsd.edu/repeatscout/RepeatScout-1.0.5.tar.gz
tar -xvzf $soft.tar.gz
cd RepeatScout-1
make
make install
mkdir -p /opt/bioinf/modulefiles/RepeatScout

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/RepeatScout/1.0.5
#%Module#####################################################################
## RepeatScout
set version 1.0.5
proc ModulesHelp { } {
puts stderr "This module enables the use of RepeatScout software to"
puts stderr "identify repeat family sequences from genomes where band-curated "
puts stderr "repeat databases are not available"
puts stderr " "
}
module-whatis "RepeatScout"
set prefix /opt/bioinf/RepeatScout-${version}
prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/RepeatScout/.modulerc
#%Module
if {![info exists rs-done]} {
module-version RepeatScout/1.0.5 1.0
module-version RepeatScout/1.0 default
set rs-done 1
}
#EOF#
