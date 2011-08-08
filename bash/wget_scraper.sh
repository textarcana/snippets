# A simple spider that will crawl a site and retrieve all resources

test -n $1 || echo "usage: wget_scraper.sh example.com"

export DOMAIN=$1
export NAME_FOR_LOG=$1_log

mv $NAME_FOR_LOG.log $NAME_FOR_LOG.`date +%C%y-%m-%d-at-%H-%M-%S`.log

wget -r -l inf -H -nc -w23 \
    --random-wait --limit-rate=80k -erobots=off \
    --page-requisites -D $DOMAIN \
    --restrict-file-names=windows \
    -U "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.14) Gecko/2009090214" \
    -o $NAME_FOR_LOG.log \
    http://$DOMAIN/ &

tail -f $NAME_FOR_LOG.log
