#!/bin/bash

soft=rdptools
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $install
git clone https://github.com/rdpstaff/RDPTools.git rdptools-git
git submodule init
git submodule update
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## rdptools
set version git
proc ModulesHelp { } {
puts stderr "This module enables rdptools"
puts stderr " "
}
module-whatis "rdptools"

set prefix /opt/bioinf/rdptools-${version}

prepend-path PATH ${prefix}
setenv AbundanceStats ${prefix}/AbundanceStats.jar
prepend-path CLASSPATH ${prefix}/AbundanceStats.jar
setenv AlignmentTools ${prefix}/AlignmentTools.jar
prepend-path CLASSPATH ${prefix}/AlignmentTools.jar
setenv classifier ${prefix}/classifier.jar
prepend-path CLASSPATH ${prefix}/classifier.jar
setenv Clustering ${prefix}/Clustering.jar
prepend-path CLASSPATH ${prefix}/Clustering.jar
setenv Framebot ${prefix}/Framebot.jar
prepend-path CLASSPATH ${prefix}/Framebot.jar
setenv hmmgs ${prefix}/hmmgs.jar
prepend-path CLASSPATH ${prefix}/hmmgs.jar
setenv KmerFilter ${prefix}/KmerFilter.jar
prepend-path CLASSPATH ${prefix}/KmerFilter.jar
setenv ProbeMatch ${prefix}/ProbeMatch.jar
prepend-path CLASSPATH ${prefix}/ProbeMatch.jar
setenv ReadSeq ${prefix}/ReadSeq.jar
prepend-path CLASSPATH ${prefix}/ReadSeq.jar
setenv SeqFilters ${prefix}/SeqFilters.jar
prepend-path CLASSPATH ${prefix}/SeqFilters.jar
setenv SequenceMatch ${prefix}/SequenceMatch.jar
prepend-path CLASSPATH ${prefix}/SequenceMatch.jar
#EOF#
