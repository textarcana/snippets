# How to print a message if a command fails, while still returning a
# nonzero exit code.
#
# If you do `ls bla || echo "ERROR: you must create directory foo"`
# then your exit code will be printed correctly but you will wind up
# with $? containing the (successful) exit code of echo, not of of ls.
#
# To circumvent this, do the following (note the parentheses):

ls foo || (echo 'ERROR: first you must mkdir foo' && exit 1)

# So much for exiting from a script.  But if you run the above in a
# terminal, it will close your terminal session!  Instead you can use
# the test command to return a nonzero exit code without exiting the
# terminal.:

ls foo || (echo 'ERROR: first you must mkdir foo' && test a = b)

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
