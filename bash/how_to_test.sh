# check whether a Selenium server is already running
# and kill any running servers that are found

ps ax | grep selenium | cut -d' ' -f2 | xargs kill

# wait until port 4444 opens up

while ! nc -vz localhost 4444; do sleep 1 && echo "checking whether service is up    `date`"; done

# validate that two sha1 hashes are identical
#
# NOTE: When using echo, you have to include the -n option, otherwise
# it will glom a newline onto the end of the string and your hash
# won't be what you expect.

test `echo -n foo | shasum | cut -d' ' -f1` == `perl -e "print qq{foo}" | shasum | cut -d' ' -f1` && echo hashes are the same || echo OOPS! hash mismatch
