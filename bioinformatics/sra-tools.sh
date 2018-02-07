#!/bin/bash

soft=sra-tools
version=git
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir $prefix
cd $src
git clone https://github.com/ncbi/ngs.git
cd ngs
./configure --prefix=/opt/bioinf/ngs-git
make
make install
cd ..
git clone https://github.com/ncbi/ncbi-vdb.git
cd ncbi-vdb
./configure --prefix=/opt/bioinf/ncbi-vdb-git --with-ngs-sdk-prefix=/opt/bioinf/ngs-git
make
make install
cd ..
git clone https://github.com/ncbi/sra-tools.git
cd $soft
./configure --prefix=$prefix --with-ngs-sdk-prefix=/opt/bioinf/ngs-git  --with-ncbi-vdb-sources=/opt/src/ncbi-vdb 
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## SRATools
set version git
proc ModulesHelp { } {
puts stderr "This module enables SRA Tools"
puts stderr " "
}
module-whatis "SRA Tools"

set prefix /opt/bioinf/sra-tools-${version}

prepend-path CPATH ${prefix}/include
prepend-path CPATH /opt/bioinf/ngs-git/include
prepend-path CPATH /opt/bioinf/ncbi-vdb-git/include
prepend-path PATH ${prefix}/bin
prepend-path CLASSPATH /opt/bioinf/ngs-git/jar/ngs-java.jar
prepend-path LIBRARY_PATH ${prefix}/lib64
prepend-path LIBRARY_PATH /opt/bioinf/ncbi-vdb-git/lib64
prepend-path LIBRARY_PATH /opt/bioinf/ngs-git/lib64
prepend-path LD_LIBRARY_PATH /opt/bioinf/ngs-git/lib64
prepend-path LD_LIBRARY_PATH /opt/bioinf/ncbi-vdb-git/lib64
prepend-path LD_LIBRARY_PATH ${prefix}/lib64
prepend-path MANPATH ${prefix}/share/man
prepend-path MANPATH /opt/bioinf/ngs-git/share/man
setenv NCBI_VDB_LIBDIR /opt/bioinf/ncbi-vdb-git/lib64
#EOF#
