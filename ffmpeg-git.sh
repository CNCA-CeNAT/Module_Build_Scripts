#!/bin/bash

soft=ffmpeg
version=git
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg
git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg-cuda
cd ffmpeg-git
./configure --prefix=/opt/tools/ffmpeg-git
make
make install
cd ../ffmpeg-cuda
./configure --prefix=/opt/tools/ffmpeg-cuda --enable-cuda --enable-cuvid --enable-nvenc --enable-nonfree --enable-libnpp --extra-cflags=-I/opt/tools/cuda-8.0/include --extra-ldflags=-L/opt/tools/cuda-8.0/lib64 
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## ffmpeg
set version git
proc ModulesHelp { } {
puts stderr "This module enables ffmpeg with a basic implementation"
puts stderr " "
}
module-whatis "ffmpeg cpu"

set prefix /opt/tools/ffmpeg-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/cuda
#%Module#####################################################################
## ffmpeg-cuda
set version cuda
proc ModulesHelp { } {
puts stderr "This module enables ffmpeg compiled with cuda"
puts stderr " "
}
module-whatis "ffmpeg with cuda support"

prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
