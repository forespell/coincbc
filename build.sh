#!/usr/bin/env bash
set -e

UNAME="$(uname)"
export CFLAGS="${CFLAGS} -O3"
export CXXFLAGS="${CXXFLAGS} -O3"
if [ "${UNAME}" == "Darwin" ]; then
  # for Mac OSX
  export CC=gcc
  export CXX=g++
else
  # for Linux
  export CC=
  export CXX=
fi

WITH_BLAS_LIB="-L${PREFIX}/lib -Wl,--no-as-needed -lmkl_rt -lpthread -lm -ldl"
WITH_LAPACK_LIB="-L${PREFIX}/lib -Wl,--no-as-needed -lmkl_rt -lpthread -lm -ldl"

ls

CC="${CC}" CXX="${CXX}" ./configure \
  --prefix="${PREFIX}" \
  --exec-prefix="${PREFIX}" \
  --with-blas-lib="${WITH_BLAS_LIB}" \
  --with-lapack-lib="${WITH_LAPACK_LIB}" \
  --enable-cbc-parallel \
  --disable-static \
  --enable-shared \
  --enable-dependency-linking \
  || { cat config.log; exit 1; }

make -j
make install
