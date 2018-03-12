#!/bin/sh

BASEDIR=${BASEDIR:-${BASEDIR}/tmp/ghdl_build}
BUILDDIR=${BUILDDIR:-${BASEDIR}/build}
PREFIX=${PREFIX:-/usr/local}
GHDL_VERSION=${GHDL_VERSION:-0.35}
GCC_VERSION=${GCC_VERSION:-$(gcc --version | sed -e 1b -e '$!d' - | sed -r "s/.*([0-9]+\.[0-9]+\.[0-9]+).*/\1/g" -)}

# create temporary build directory
mkdir -p ${BASEDIR}; cd ${BASEDIR}

# download gcc and install prerequisites
wget http://www.netgull.com/gcc/releases/gcc-${GCC_VERSION}/gcc-${GCC_VERSION}.tar.bz2
tar jxf gcc-${GCC_VERSION}.tar.bz2
cd gcc-${GCC_VERSION}
./contrib/download_prerequisites

# download ghdl
cd ${BASEDIR}
wget https://github.com/ghdl/ghdl/archive/v${GHDL_VERSION}.tar.gz -O ghdl-${GHDL_VERSION}.tar.gz
tar xzf ghdl-${GHDL_VERSION}.tar.gz

# configure ghdl
mkdir -p ${BUILDDIR}; cd ${BUILDDIR}
${BASEDIR}/ghdl-${GHDL_VERSION}/configure --with-gcc=${BASEDIR}/gcc-${GCC_VERSION} --prefix=${PREFIX}
make copy-sources

# build gcc
mkdir -p ${BUILDDIR}/gcc-objs; cd ${BUILDDIR}/gcc-objs
${BASEDIR}/gcc-${GCC_VERSION}/configure --prefix=${PREFIX} --enable-languages=c,vhdl --disable-bootstrap --disable-lto --disable-multilib --disable-libssp --disable-libgomp --disable-libquadmath
make -j4 && make install

# install ghdl
cd ${BUILDDIR}
make ghdllib
make install

# delete all build artifacts
cd /
rm -rf ${BASEDIR}
