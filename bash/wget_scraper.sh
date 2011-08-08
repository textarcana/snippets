# A simple spider that will crawl a site and retrieve all resources.
# Good for archiving sites or finding broken links.
#
# As written, DOES NOT RESPECT ROBOTS.TXT -- use at your own
# (non-trivial) risk, or just delete the option -erobots=off

test -n $1 || echo "usage: wget_scraper.sh example.com"

export DOMAIN=$1
export NAME_FOR_LOG=$1_log
export WAIT_TIME=23

test -e $NAME_FOR_LOG && mv $NAME_FOR_LOG.log $NAME_FOR_LOG.`date +%C%y-%m-%d-at-%H-%M-%S`.log

wget -r -l inf -H -nc -w$WAIT_TIME \
    --random-wait --limit-rate=80k -erobots=off \
    --page-requisites -D $DOMAIN \
    --restrict-file-names=windows \
    -U "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.14) Gecko/2009090214" \
    -o $NAME_FOR_LOG.log \
    http://$DOMAIN/


