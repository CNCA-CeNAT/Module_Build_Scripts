#!/bin/bash

. /opt/intel/bin/compilervars.sh intel64
soft=velvet
src=/opt/src
prefix=/opt/bioinf/${soft}-1.2.10-301kmer-openmp
cd $src
mkdir -p $prefix
git clone git://github.com/dzerbino/velvet.git
cd $soft
make 'OPENMP=1' 'MAXKMERLENGTH=301' color
mkdir -p /opt/bioinf/modulefiles/velvet
exes=/opt/src/velvet-kmer301-openmp

/bin/cat <<"#EOF#" > /opt/bioinf/modulefiles/velvet/1.2.10-301kmer-openmp
#%Module#####################################################################
## velvet 
set version 1.2.10-301kmer-openmp
proc ModulesHelp { } {
puts stderr "This module enables the use of Velvet sequence assembler"
puts stderr "for very short reads."
puts stderr "The compilation options used are:"
puts stderr "make"
puts stderr "make color"
puts stderr "make 'OPENMP=1' 'MAXKMERLENGTH=301'  "

}
module-whatis "Velvet sequence assembler"
set prefix /opt/src/velvet-kmer301-openmp
prepend-path PATH ${prefix}
#EOF#
