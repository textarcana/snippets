# On Mac OSX, Show local listening TCP/UDP ports, and the process they
# belong to. See http://serverfault.com/questions/11289/2699

sudo lsof -i -n -P | grep LISTEN

# Show a sorted list of listening ports and services.

sudo lsof -i -n -P | \
    perl -lnwe 'm{^(\w+).*:(\d+) \(LISTEN} and print qq{$2\t$1}' | \
    sort -n | uniq

# Refresh the list automatically

while true;do \
    sudo lsof -i -n -P | \
    perl -lnwe 'm{^(\w+).*:(\d+) \(LISTEN} and print qq{$2\t$1}' | \
    sort -n | \
    uniq && \
    sleep 5 && \
    clear; \
    done

# and here are some actual netstat tips, for Linux systems:

netstat -a | egrep 'Proto|LISTEN'

# for port numbers instead of service names:

netstat -an | egrep 'Proto|LISTEN'

# show open ports and their processes:

netstat -lnptu
