SET CFLAGS=%CFLAGS% -O3
SET CXXFLAGS=%CXXFLAGS% -O3
SET CC=gcc
SET CXX=g++

SET PREFIX=%PREFIX:\=/%
SET WITH_BLAS_LIB="-L%PREFIX%/Library/bin -Wl,--no-as-needed -lmkl_rt -lpthread -lm"
SET WITH_LAPACK_LIB="-L%PREFIX%/Library/bin -Wl,--no-as-needed -lmkl_rt -lpthread -lm"

ls

bash configure ^
  --build=x86_64-w64-mingw32 ^
  --host=x86_64-w64-mingw32 ^
  --target=x86_64-w64-mingw32 ^
  --disable-pkg-config ^
  --prefix="%PREFIX%" ^
  --exec-prefix="%PREFIX%" ^
  --with-blas-lib=%WITH_BLAS_LIB% ^
  --with-lapack-lib=%WITH_LAPACK_LIB% ^
  --enable-cbc-parallel

make -j
REM make -j test
make install
