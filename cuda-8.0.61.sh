#!/bin/bash

. /opt/intel/bin/compilervars.sh intel64
soft=cuda-8.0
src=/opt/src
prefix=/opt/tools/cuda-8.0
cd $src
mkdir -p $prefix
mkdir -p $soft
wget --quiet https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run

bash cuda_8.0.61_375.26_linux-run --silent --toolkit --toolkitpath=$prefix 
mkdir -p /opt/tools/modulefiles/cuda

/bin/cat <<"#EOF#" > /opt/tools/modulefiles/cuda/8.0.61
#%Module#######################################################
set version 8.0
proc ModulesHelp { } {
puts stderr "This module provides the CUDA-8.0 toolkit"
puts stderr "It updates the environment variables \$PATH, \$CUDAHOME,"
puts stderr "\$LD_LIBRARY_PATH, \$CPATH and \$PKG_CONFIG_PATH"
puts stderr ""
puts stderr "The following variables are defined for use in Makefiles:"
puts stderr ""
puts stderr "\$CUDADIR, \$CUDABIN, \$CUDAINC, \$CUDALIB"
puts stderr ""
}

module-whatis "CUDA 8.0 toolkit"
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

/bin/cat <<"#EOF#" > /opt/tools/modulefiles/cuda/.modulerc
#%Module
if {![info exists cuda-done]} {
module-version cuda/8.0 8
module-version cuda/8 default
set cuda-done 1
}

#EOF#
