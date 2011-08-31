# First, check your /etc/yum.repos.d/Centos-Base.repo
#
# It should look similar to the one included here.  In particular,
# make sure it has the ATRPMS block, as described in the comments at
# http://code.google.com/p/phantomjs/wiki/BuildInstructions

sudo yum -y install qt47-devel qt47-webkit qt47-webkit-devel sqlite-devel

# set up GPG keys for yum, see
# http://www.linuxquestions.org/questions/fedora-35/public-key-not-installed-468615/

rpm --import http://packages.atrpms.net/RPM-GPG-KEY.atrpms
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5

git clone http://github.com/ariya/phantomjs.git && cd phantomjs
git checkout 1.2
qmake-qt47 && make

cp bin/phantomjs /usr/bin/

