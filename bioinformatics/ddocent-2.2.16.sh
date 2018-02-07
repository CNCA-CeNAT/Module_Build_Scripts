#!/bin/bash

soft=dDocent
version=2.2.16
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $src
curl -L -O https://github.com/jpuritz/dDocent/archive/v2.2.16.tar.gzcurl -L -O https://github.com/jpuritz/dDocent/archive/v2.2.16.tar.gz
tar -xvzf v2.2.16.tar.gz
mv dDocent-2.2.16 $install
cd $prefix
chmod +x $soft
INSTALL_PATH=${prefix}/dependencies
mkdir dependencies
curl -O http://invisible-island.net/datafiles/release/mawk.tar.gz
tar xvzf mawk.tar.gz
cd mawk-1.*
./configure
make
chmod +x mawk
cp -f mawk $INSTALL_PATH
cd ..
curl -L -o rainbow.x.tar.gz "http://sourceforge.net/projects/bio-rainbow/files/latest/download?source=files"
tar xvzf rainbow.x.tar.gz
cd rainbow_*
make
chmod +x rainbow rbasm rbmergetag select_*
cp -f rainbow rbasm rbmergetag select_* $INSTALL_PATH
cd ..
curl -L -O https://github.com/weizhongli/cdhit/releases/download/V4.6.6/cd-hit-v4.6.6-2016-0711.tar.gz
tar xvzf cd-hit-v4.6.6-2016-0711.tar.gz
cd cd-hit-v4.6.6-2016-0711
make openmp=yes
chmod +x cd-hit-est cd-hit-est-2d
cp -f cd-hit-est cd-hit-est-2d $INSTALL_PATH
cd ..
git clone https://github.com/pezmaster31/bamtools.git
cd bamtools
mkdir build
cd build
cmake ..
make
cd ../bin
chmod +x bamtools
cp -f bamtools $INSTALL_PATH
cd ..
cd ..
curl -L -O http://ftp.gnu.org/gnu/parallel/parallel-latest.tar.bz2
tar xvjf parallel-latest.tar.bz2
rm parallel-latest.tar.bz2
cd parallel*
./configure && make
chmod +x ./src/parallel ./src/sem ./src/niceload ./src/sql
cp -f ./src/parallel ./src/sem ./src/niceload ./src/sql $INSTALL_PATH
cd ..
curl -L -O http://sco.h-its.org/exelixis/web/software/pear/files/pear-0.9.6-bin-64.tar.gz
tar vxzf pear-0.9.6-bin-64.tar.gz 
cd pear-0.9.6-bin-64
cp -f pear-0.9.6-bin-64 pearRM
chmod +x pearRM
cp -f pearRM $INSTALL_PATH
cd ..
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## dDocent
set version 2.2.16
proc ModulesHelp { } {
puts stderr "This module enables dDocent"
puts stderr " "
}
module-whatis "dDocent"

set prefix /opt/bioinf/dDocent-${version}

prepend-path PATH ${prefix}
prepend-path PATH ${prefix}/dependencies
#EOF#
