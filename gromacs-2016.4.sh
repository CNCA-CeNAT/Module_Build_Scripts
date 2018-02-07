#!/bin/bash

soft=gromacs
version=2016.4
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-2016.4.tar.gz
tar -xvzf gromacs-2016.4.tar.gz
cd gromacs-2016.4
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${prefix} -DCUDA_TOOLKIT_ROOT_DIR=/opt/tools/cuda-8.0 -DGMX_MPI=ON -DBLAS_Accelerate_LIBRARY=/opt/libs/openblas-git/lib -DBLAS_blas_LIBRARY=/opt/libs/openblas-git/lib/libopenblas.so -DGMX_OPENMP_MAX_THREADS=256 -DNVML_LIBRARY=/opt/tools/cuda-8.0/lib64/libnvidia-ml.so.1
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## gromacs
set version 2016.4
proc ModulesHelp { } {
puts stderr "This module enables Gromacs with GPU acceleration"
puts stderr " "
}
module-whatis "gromacs GPU"

set prefix /opt/tools/gromacs-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib64
prepend-path LD_LIBRARY_PATH ${prefix}/lib64
prepend-path MANPATH ${prefix}/share/man
#EOF#
