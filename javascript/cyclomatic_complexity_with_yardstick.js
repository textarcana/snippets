find lib/meteor -type f -not \( -path *.meteor* -o -path *vendor* \) -name *js $* \
 | egrep 'js$' | \
    xargs yardstick | \
    grep -v @ | egrep -v '^ ' | \
    perl -lnwe 's{^(\S+)(\s+)(\d+).*}{$3$2$1} and print' | \
    sort -rn
