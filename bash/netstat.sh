# On Mac OSX, Show local listening TCP/UDP ports, and the process they
# belong to. See http://serverfault.com/questions/11289/2699

sudo lsof -i -n -P | grep LISTEN

# Show a sorted list of listening ports and services.

sudo lsof -i -n -P | \
    perl -lnwe 'm{^(\w+).*:(\d+) \(LISTEN} and print qq{$2\t$1}' | \
    sort -n | uniq
