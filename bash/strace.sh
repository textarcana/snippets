strace -f -o./dbunit_strace.log -s 1000 pake dbunit

strace -f -c -s 1000 pake dbunit
