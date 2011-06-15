# check whether a Selenium server is already running
# and kill any running servers that are found

ps ax | grep selenium | cut -d' ' -f2 | xargs kill

# wait until port 4444 opens up

while ! nc -vz localhost 4444; do sleep 1; done

# validate that two sha1 hashes are identical
#
# NOTE: you really do need to use perl -e 'print "foo"' here, rather
# than echo "foo" (at least this is the case on Mac OS X).  I am not
# sure why this is the case :-\ but using echo will result in your not
# getting the expected hash value.

test `perl -e "print qq{foo}" | shasum | cut -d' ' -f1` == `perl -e "print qq{foo}" | shasum | cut -d' ' -f1` && echo hashes are the same || echo OOPS! hash mismatch
