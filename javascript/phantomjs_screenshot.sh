# Produce time-stamped screenshots of remote Web pages.

export FILE_NAME=`echo $1 | tr -s ':/' '-' | perl -pe 's/http-//'`
export DATE_STRING=`date +%m-%d-%Y-%H-%M-%S-%Z`.png
export OUTFILE=$FILE_NAME"_"$DATE_STRING

test -z $1 && echo 'Usage: ./phantomjs_screenshot.sh <url>'
test -z $1 && exit 1

/usr/bin/phantomjs phantomjs_rasterize.js $1 $OUTFILE && \
    echo $OUTFILE
