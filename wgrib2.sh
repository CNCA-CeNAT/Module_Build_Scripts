#!/bin/bash

soft=grib
version=2
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}${version}
mkdir ${prefix}
cd ${prefix}
wget www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz
cd grib2
sed -i 's/USE_NETCDF3=1/USE_NETCDF3=0' ./makefile
sed -i 's/USE_NETCDF4=0/USE_NETCDF4=1' ./makefile
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.19/src/hdf5-1.8.19.tar.gz
make
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## grib2
set version 2
proc ModulesHelp { } {
puts stderr "This module enables Wgrib2 for visualization"
puts stderr " "
}
module-whatis "Wgrib2"

set prefix /opt/tools/grib${version}
prepend-path PATH ${prefix}/bin
prepend-path PATH ${prefix}/wgrib2
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/man
prepend-path MANPATH ${prefix}/share/man
#EOF#
