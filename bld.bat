SET CFLAGS=%CFLAGS% -O3
SET CXXFLAGS=%CXXFLAGS% -O3
SET CC=gcc
SET CXX=g++

REM SET WITH_BLAS_LIB="-L%PREFIX%/lib -lblas"
REM SET WITH_LAPACK_LIB="-L%PREFIX%/lib -llapack"
SET WITH_BLAS_LIB="-L%PREFIX%\Library\bin -lmkl_rt -lpthread -lm -ldl"
SET WITH_LAPACK_LIB="-L%PREFIX%\Library\bin -lmkl_rt -lpthread -lm -ldl"

ls

bash configure  ^
  --build=x86_64-pc-winnt ^
  --prefix="%PREFIX%" ^
  --exec-prefix="%PREFIX%" ^
  --with-blas-lib=%WITH_BLAS_LIB% ^
  --with-lapack-lib=%WITH_LAPACK_LIB% ^
  --enable-coinutils-threads ^
  --enable-cbc-parallel

make

REM if [ "${UNAME}" == "Linux" ]; then
REM  make test
REM fi

make install
