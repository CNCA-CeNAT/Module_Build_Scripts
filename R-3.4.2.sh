#!/bin/bash
#. /opt/intel/bin/compilervars.sh intel64
soft=R
version=3.4.2
install=/opt/compilers
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p $prefix
wget --quiet https://cran.cnr.berkeley.edu/src/base/R-3/R-3.4.2.tar.gz
tar -xvzf ${soft}-${version}.tar.gz
cd ${soft}-${version}
./configure --prefix=$prefix --enable-R-profiling --enable-memory-profiling --enable-R-shlib --enable-R-static-lib --enable-BLAS-shlib --enable-static --enable-shared --enable-long-double --with-blas --with-lapack --with-cairo --with-libpng --with-recommended-packages
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/3.4.2
#%Module#####################################################################
## R
set version 3.4.2
## R software environment for statistical computing and graphics package
set version 3.4.2
proc ModulesHelp { } {
puts stderr "This module enables using the R environment,"
puts stderr "which allows data handling and calculations for statistical analysis"
puts stderr ". The environment variables \$PATH, \$CPATH, \$LIBRARY_PATH,"
puts stderr " \$LD_LIBRARY_PATH, and \$MANPATH are set accordingly."
puts stderr " "
}
module-whatis "R software environment for statistical computing and graphics"

set prefix /opt/compilers/R-${version}

setenv R_HOME ${prefix}/lib64/R

prepend-path CPATH ${prefix}/lib64/R/include/
prepend-path PATH ${prefix}/lib64/R/bin/
prepend-path LIBRARY_PATH ${prefix}/lib64/R/lib/
prepend-path LIBRARY_PATH ${prefix}/lib64/R/libs/
prepend-path LD_LIBRARY_PATH ${prefix}/lib64/R/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib64/R/libs/
prepend-path MANPATH ${prefix}/share/man/

#R packages enviroment variables

#RInside
prepend-path CPATH ${prefix}/lib64/R/library/RInside/include/
prepend-path LIBRARY_PATH ${prefix}/lib64/R/library/RInside/lib/
prepend-path LIBRARY_PATH ${prefix}/lib64/R/library/RInside/libs/
prepend-path LD_LIBRARY_PATH ${prefix}/lib64/R/library/RInside/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib64/R/library/RInside/libs/

#RCpp
prepend-path CPATH ${prefix}/lib64/R/library/Rcpp/include/
prepend-path LIBRARY_PATH ${prefix}/lib64/R/library/Rcpp/libs/
prepend-path LD_LIBRARY_PATH ${prefix}/lib64/R/library/Rcpp/libs/

#EOF#
