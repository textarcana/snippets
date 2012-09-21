# Check whether a port is listening

nc -vz 10.0.1.9 8080

# Look for an open port in the 8k range

nc -vz 10.0.1.9 8000-8999 2> /dev/null

# Chat server: listen for incoming messages

nc -lk 3333

# Chat server: send message

echo 'hi world' | nc 10.0.1.9 3333
