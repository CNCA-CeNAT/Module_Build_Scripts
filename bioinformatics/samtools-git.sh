#!/bin/bash

soft=samtools
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
git clone https://github.com/samtools/htslib.git
cd htslib
mkdir -p ${install}/htslib-git
mkdir -p ${prefix}
autoheader
autoconf
./configure --prefix=/opt/bioinf/htslib-git
make
make install
cd ${src}
git clone git://github.com/samtools/samtools.git  
cd ${soft}
autoheader
autoconf
./configure --prefix=${prefix} --with-htslib=/opt/bioinf/htslib-git
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## samtools
set version git
proc ModulesHelp { } {
puts stderr "This module enables samtools"
puts stderr " "
}
module-whatis "samtools"

set prefix /opt/bioinf/samtools-${version}
prepend-path PATH ${prefix}/bin
prepend-path MANPATH ${prefix}/share/man
#EOF#

mkdir -p /opt/bioinf/modulefiles/htslib

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/htslib/git
#%Module#####################################################################
## htslib
set version git
proc ModulesHelp { } {
puts stderr "This module enables htslib"
puts stderr " "
}
module-whatis "htslib"

set prefix /opt/bioinf/htslib-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
