#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=readseq
version=java
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir -p ${prefix}
cd ${prefix}
curl -L https://sourceforge.net/projects/readseq/?source=typ_redirect
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## readseq
set version java
proc ModulesHelp { } {
puts stderr "This module enables readeq"
puts stderr " "
}
module-whatis "Readseq"

set prefix /opt/bioinf/readseq-${version}
setenv readseq ${prefix}/readseq.jar
prepend-path CLASSPATH ${prefix}/readseq.jar
#EOF#
