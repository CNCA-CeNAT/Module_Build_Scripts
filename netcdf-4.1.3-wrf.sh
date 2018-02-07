#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
soft=netcdf-4.1.3
src=/opt/src
prefix=/opt/libs/${soft}-gcc
cd $src
mkdir -p $prefix
tar -xvzf ${soft}.tar.gz
cd $soft
./configure --disable-shared --prefix=$prefix --enable-fortran --disable-netcdf-4
make -j4
make install
mkdir -p /opt/libs/modulefiles/netcdf

/bin/cat <<"#EOF#" > /opt/libs/modulefiles/netcdf/4.1.3-gcc
#%Module#####################################################################
## netCDF 
set version 4.1.3-gcc
proc ModulesHelp { } {
puts stderr "This module enables the use of data formats supporting the "
puts stderr "creation, access and sharing of array oriented scientific "
puts stderr "data."
puts stderr " "
puts stderr "Added --enable-fortran --disable-netcdf-4"
puts stderr "Compiled with gcc"
}
module-whatis "Network Common Data Form"
set prefix /opt/libs/netcdf-${version}
prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
