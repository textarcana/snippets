# A simple spider that will crawl a site without downloading anything.
# Good for finding broken links.
#
# If you would retrieve all resources, (good for archiving sites) then
# simply delete the option --spider
#
# Download rate is limited to 80k per chunk, with a randomized wait
# time of 23 seconds between each chunk.  This is slow but it does
# mean the script will not be detected by most automated sniffs meant
# to detect (and possibly block) spiders.
# 
# The spider identifies as Firefox in order to avoid getting sent down
# rabbit holes meant for robots and "non-JavaScript" browsers -- we
# actually would like to find out what happens if there is no
# JavaScript.
#
# As written, DOES NOT RESPECT ROBOTS.TXT -- use at your own
# (non-trivial) risk, or just delete the option -erobots=off
#
# Requires wget 1.12 or better.

test -n $1 || echo "usage: wget_scraper.sh example.com"

export DOMAIN=$1
export NAME_FOR_LOG=$1
export TIMEOUT=60
export WAIT_TIME=23

test -e $NAME_FOR_LOG && mv $NAME_FOR_LOG.log $NAME_FOR_LOG.`date +%C%y-%m-%d-at-%H-%M-%S`.log

wget -r -l inf -H -nc -w$WAIT_TIME \
    --spider \
    --random-wait --limit-rate=80k -erobots=off \
    --timeout=$TIMEOUT \
    --page-requisites -D $DOMAIN \
    --restrict-file-names=unix \
    -U "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.14) Gecko/2009090214" \
    -o $NAME_FOR_LOG.log \
    http://$DOMAIN/
