# check whether a Selenium server is already running
# and kill any running servers that are found

ps ax | grep selenium | cut -d' ' -f2 | xargs kill

# wait until port 4444 opens up

while ! nc -vz localhost 4444; do sleep 1; done

# validate that two sha1 hashes are identical

test `echo doh! | shasum | cut -d' ' -f1` == `echo doh! | shasum | cut -d' ' -f1` && echo ok || echo nope
