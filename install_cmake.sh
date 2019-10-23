wget "https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4.tar.gz"
tar xf "cmake-*"
cd "./cmake*"
./configure
make
make install
export PATH=/usr/local/bin:$PATH
cmake --version
