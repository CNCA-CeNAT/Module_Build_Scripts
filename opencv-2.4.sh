#!/bin/bash

soft=opencv
version=2.4.13.3
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
git clone https://github.com/opencv/opencv.git opencv-2.4
cd opencv-2.4
git checkout 2.4
mkdir build
cd build
cmake .. -DCUDA_TOOLKIT_ROOT_DIR=/opt/tools/cuda-8.0 -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_BUILD_TYPE=Release -DBUILD_opencv_cudacodec=ON -DCUDA_FAST_MATH=ON -DFFMPEG_INCLUDE_DIR=/opt/tools/ffmpeg-cuda -DPYTHON2_EXECUTABLE=/opt/intel/intelpython27/bin/python2.7 -DPYTHON3_EXECUTABLE=/opt/intel/intelpython35/bin/python3.5 -DWITH_CUBLAS=ON -DWITH_OPENMP=ON -DJASPER_INCLUDE_DIR=/opt/libs/jasper-2.0.12/include -DJASPER_LIBRARY_RELEASE=/opt/libs/jasper-2.0.12/lib64/libjasper.so
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## opencv
set version 2.4.13.3
proc ModulesHelp { } {
puts stderr "This module enables Opencv with GPU acceleration"
puts stderr " "
}
module-whatis "Opencv GPU"

set prefix /opt/tools/opencv-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
prepend-path PYTHONPATH ${prefix}/lib/python2.7/site-packages
#EOF#
