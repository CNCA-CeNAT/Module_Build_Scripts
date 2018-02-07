#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=nseg
version=gcc
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}/bin
mkdir $soft
cd $soft
wget ftp://ftp.ncbi.nih.gov/pub/seg/nseg/genwin.c
wget ftp://ftp.ncbi.nih.gov/pub/seg/nseg/genwin.h
wget ftp://ftp.ncbi.nih.gov/pub/seg/nseg/lnfac.h
wget ftp://ftp.ncbi.nih.gov/pub/seg/nseg/makefile
wget ftp://ftp.ncbi.nih.gov/pub/seg/nseg/nmerge.c
wget ftp://ftp.ncbi.nih.gov/pub/seg/nseg/nseg.c
wget ftp://ftp.ncbi.nih.gov/pub/seg/nseg/runnseg
make
cp nmerge nseg ${prefix}/bin/
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## nseg
set version gcc
proc ModulesHelp { } {
puts stderr "This module enables NSEG"
puts stderr " "
}
module-whatis "NSEG"

set prefix /opt/bioinf/nseg-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
