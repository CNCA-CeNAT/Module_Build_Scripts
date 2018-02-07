#!/bin/bash

. /opt/intel/bin/compilervars.sh intel64
soft=cuda-6.5
src=/opt/src
prefix=/opt/tools/cuda-6.5
cd $src
mkdir -p $prefix
mkdir -p $soft
wget --quiet http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run
bash cuda_6.5.14_linux_64-run --silent --toolkit --toolkitpath=$prefix --override
mkdir -p /opt/tools/modulefiles/cuda

/bin/cat <<"#EOF#" > /opt/tools/modulefiles/cuda/6.5.14
#%Module#######################################################
set version 6.5
proc ModulesHelp { } {
puts stderr "This module provides the CUDA-6.5 toolkit"
puts stderr "It updates the environment variables \$PATH, \$CUDAHOME,"
puts stderr "\$LD_LIBRARY_PATH, \$CPATH and \$PKG_CONFIG_PATH"
puts stderr ""
puts stderr "The following variables are defined for use in Makefiles:"
puts stderr ""
puts stderr "\$CUDADIR, \$CUDABIN, \$CUDAINC, \$CUDALIB"
puts stderr ""
}

module-whatis "CUDA 6.5 toolkit"
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
