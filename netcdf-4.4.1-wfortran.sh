#!/bin/bash

. /opt/intel/bin/compilervars.sh intel64
soft=netcdf-4.4.1
src=/opt/src
prefix=/opt/libs/$soft
cd $src
mkdir -p $prefix
wget --quiet ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.tar.gz
tar -xvzf ${soft}.tar.gz
cd $soft
LD_LIBRARY_PATH=/opt/libs/hdf5-1.10.0-patch1/lib:$LD_LIBRARY_PATH ./configure --enable-shared --enable-static --enable-jna --enable-nmap --enable-pnetcdf --with-hdf5=/opt/libs/hdf5-1.10.0-patch1  --prefix=/opt/libs/netcdf-4.4.1-wfortran --enable-separate-fortran --enable-netcdf4 --with-zlib=/opt/libs/szip-2.1
make -j20
make install
mkdir -p /opt/libs/modulefiles/netcdf

/bin/cat <<"#EOF#" > /opt/libs/modulefiles/netcdf/4.4.1-wfortran
#%Module#####################################################################
## netCDF 
set version 4.4.1-wfortran
proc ModulesHelp { } {
puts stderr "This module enables the use of data formats supporting the "
puts stderr "creation, access and sharing of array oriented scientific "
puts stderr "data."
puts stderr " "
puts stderr "Added --enable-separate-fortran --enable-netcdf4"
puts stderr "--with-zlib=/opt/libs/szip-2.1 options for compilation"
}
module-whatis "Network Common Data Form"
set prefix /opt/libs/netcdf-${version}
prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
