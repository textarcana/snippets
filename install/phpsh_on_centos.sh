# https://github.com/facebook/phpsh

sudo yum -y install ncurses-devel ncurses-static
sudo easy_install pysqlite readline

git clone git://github.com/facebook/phpsh.git

cd phpsh
python setup.py build
sudo python setup.py install
