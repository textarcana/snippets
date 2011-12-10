# cd into each directory and execute a git pull
#
# see http://stackoverflow.com/questions/7470165

find . -maxdepth 1 -type d -exec sh -c '(cd {} && git pull --rebase)' ';'
