#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=bowtie2
version=2.2.9
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
curl -OL http://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.2.9/bowtie2-2.2.9-linux-x86_64.zip
unzip bowtie2-2.2.90linux-x86_64.zip
cd bowtie2-2.2.9
cp ./* $prefix
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## bowtie2
set version 2.2.9
proc ModulesHelp { } {
puts stderr "This module enables bowtie"
puts stderr " "
}
module-whatis "bowtie"

set prefix /opt/bioinf/bowtie2-${version}

prepend-path PATH ${prefix}
#EOF#
