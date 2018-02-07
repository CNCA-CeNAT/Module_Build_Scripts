#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
export LARGE_FILES="TRUE"
soft=nwchem
version=6.6
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
wget http://www.nwchem-sw.org/download.php?f=Nwchem-6.6.revision27746-src.2015-10-20.tar.gz
tar -xvzf Nwchem-6.6.revision27746-src.2015-10-20.tar.gz
mv nwchem-6.6 ${install}
cd ${prefix}
export NWCHEM_TOP=${prefix}
export NWCHEM_TARGET=LINUX64
export NWCHEM_MODULES="all python qm"
export USE_MPI=y
export USE_MPIF=y
export MPI_LOC=/opt/tools/mpich-3.2
export MPI_LIB=${MPI_LOC}/include
export LIBMPI="-lfmpich -lmpich -lpmpich"
export PYTHONHOME=/opt/intel/intelpython35 
export PYTHONVERSION=3.5
export USE_PYTHON64=y
export PYTHONPATH=/opt/intel/intelpython35/lib/python3.5/site-packages
cd ${NWCHEM_TOP}/src
make FC=ifort CC=icc nwchem_config
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## NWchem
set version 6.6
proc ModulesHelp { } {
puts stderr "This module enables NWchem"
puts stderr " "
}
module-whatis "NWchem"

set prefix /opt/tools/nwchem-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib64
prepend-path LD_LIBRARY_PATH ${prefix}/lib64
prepend-path MANPATH ${prefix}/share/man
setenv LARGE_FILES TRUE
setenv NWCHEM_TOP=${prefix}
setenv NWCHEM_TARGET=LINUX64
setenv NWCHEM_MODULES=all
setenv USE_MPI y
setenv USE_MPIF y
setenv MPI_LOC /opt/tools/mpich-3.2
setenv MPI_LIB ${MPI_LOC}/include
setenv LIBMPI "-lfmpich -lmpich -lpmpich"
setenv PYTHONHOME /opt/intel/intelpython35
setenv PYTHONVERSION 3.5
setenv USE_PYTHON64 y
setenv PYTHONPATH /opt/intel/intelpython35/lib/python3.5/site-packages
#EOF#
