# On Mac OSX, Show local listening TCP/UDP ports, and the process they
# belong to. See http://serverfault.com/questions/11289/2699

sudo lsof -i -n -P | grep LISTEN
