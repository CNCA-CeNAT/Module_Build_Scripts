#!/bin/bash

soft=cuda
version=9.0.176
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
mkdir -p ${prefix}
mkdir -p ${soft}-${version}
cd ${soft}-${version}
wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
bash cuda_9.0.176_384.81_linux-run --silent --toolkit --toolkitpath=$prefix 
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#######################################################
set version 9.0.176
proc ModulesHelp { } {
puts stderr "This module provides the CUDA-9.0.176 toolkit"
puts stderr "It updates the environment variables \$PATH, \$CUDAHOME,"
puts stderr "\$LD_LIBRARY_PATH, \$CPATH and \$PKG_CONFIG_PATH"
puts stderr ""
puts stderr "The following variables are defined for use in Makefiles:"
puts stderr ""
puts stderr "\$CUDADIR, \$CUDABIN, \$CUDAINC, \$CUDALIB"
puts stderr ""
}

module-whatis "CUDA 9.0.176 toolkit"
set prefix /opt/tools/cuda-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib64
prepend-path LD_LIBRARY_PATH ${prefix}/lib64
prepend-path PKG_CONFIG_PATH ${prefix}/pkgconfig

setenv CUDADIR ${prefix}
setenv CUDAHOME ${prefix}
setenv CUDABIN ${prefix}/bin
setenv CUDALIB ${prefix}/lib64
setenv CUDAINC ${prefix}/include
#EOF#
