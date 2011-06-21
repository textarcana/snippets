wget http://mirror.clarkson.edu/gnu/emacs/emacs-23.3.tar.gz

tar -xzf emacs-23.3.tar.gz 

cd emacs-23.3

./configure --without-x

make

# test the build
src/emacs -Q

sudo make install
