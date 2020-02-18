# PREP .bashrc
# mkdir $HOME/opt
# mkdir $HOME/opt/cross 

# export PREFIX="$HOME/opt/cross"
# export TARGET=i386-elf
# export PATH="$PREFIX/bin:$PATH"


# BINUTILS
mkdir $HOME/src

mkdir /tmp/src
cd /tmp/src
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz
tar xf binutils-2.24.tar.gz

cd $HOME/src
mkdir build-binutils
cd build-binutils
sudo /tmp/src/binutils-2.24/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make all install 2>&1 | tee make.log

#gcc
cd $HOME/src
mkdir gcc-build

cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2

cd $HOME/src/gcc-build
sudo /tmp/src/gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
make all-gcc 
make all-target-libgcc 
make install-gcc 
make install-target-libgcc 

#.bashrc
# export PATH="$HOME/opt/cross/bin:$PATH"

$HOME/opt/cross/bin/$TARGET-gcc --version