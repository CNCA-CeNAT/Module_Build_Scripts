#!/bin/bash

#source /opt/intel/bin/compilervars.sh intel64
#source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=lastaligner
version=719
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
curl -O http://last.cbrc.jp/last-719.zip
unzip last-719.zip
cd last-719
make
cp src/lastdb ${prefix}
cp src/lastal ${prefix}
cp src/last-split ${prefix}
cp src/last-merge-batches ${prefix}
cp src/last-pair-probs ${prefix}
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## lastaligner
set version 719
proc ModulesHelp { } {
puts stderr "This module enables last aligner"
puts stderr " "
}
module-whatis "last aligner"

set prefix /opt/bioinf/lastaligner-${version}

prepend-path PATH ${prefix}
#EOF#
