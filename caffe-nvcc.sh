#!/bin/bash

soft=caffe
version=nvcc
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
git clone https://github.com/BVLC/caffe.git caffe-nvcc
cd caffe-nvcc
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_BUILD_TYPE=Release -DUSE_OPENMP=ON -DBoost_INCLUDE_DIR=/opt/libs/boost_1_65_0/include -DBoost_LIBRARY_DIR=/opt/libs/boost_1_65_0/lib -DHDF5_IS_PARALLEL=OFF -DHDF5_DIFF_EXECUTABLE=/opt/libs/hdf5-1.10.0-patch1-nonparallel/bin/h5diff -DHDF5_hdf5_LIBRARY_RELEASE=/opt/libs/hdf5-1.10.0-patch1-nonparallel/lib/libhdf5.so -DHDF5_hdf5_hl_LIBRARY_RELEASE=/opt/libs/hdf5-1.10.0-patch1-nonparallel/lib/libhdf5_hl.so -DHDF5_HL_INCLUDE_DIR=/opt/libs/hdf5-1.10.0-patch1-nonparallel/include -DCUDA_TOOLKIT_ROOT_DIR=/opt/tools/cuda-8.0 -DCUDNN_ROOT=/opt/libs/cudnn-8/6.0.21 -DCUDD_LIBRARY=/opt/libs/cudnn-8/6.0.21/lib64/libcudnn.so -DCUDNN_INCLUDE=/opt/libs/cudnn-8/6.0.21/include  -DBLAS=open -DOpenBLAS_INCLUDE_DIR=/opt/libs/openblas-git/include -DOpenBLAS_LIB=/opt/libs/openblas-git/lib/libopenblas.a -Dpython_version=3 -Wno-dev
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## caffe
set version nvcc
proc ModulesHelp { } {
puts stderr "This module enables Caffe with GPU acceleration"
puts stderr " "
}
module-whatis "Caffe with GPU support"

set prefix /opt/tools/caffe-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
