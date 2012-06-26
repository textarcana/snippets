export FILE_NAME=`echo $1 | tr -s ':/' '-' | perl -pe 's/http-//'`
export DATE_STRING=`date +%m-%d-%Y-%H-%M-%S-%Z`.png
export OUTFILE=$FILE_NAME"_"$DATE_STRING

/usr/bin/phantomjs rasterize.js $1 $OUTFILE


