# listen for traffic to / from example.com

sudo tcpdump -i eth0 host example.com

# show all udp, icmp or tcp packet traffic

sudo tcpdump udp

# im in ur web browzar, sniffin ur pakkitz

sudo tcpdump -s 1514 -c 1024 port 80

# Packet porn

sudo tcpdump -SX -s 1514 port 80

# Show all hosts on a network by
# performing reverse DNS lookups.

nmap -sL 10.0.1.0/24

# Find hosts that respond to pings.

nmap -sP 10.0.1.0/24 

# look for an open port in the 8k range

nc -vz 10.0.1.9 8000-8999 2> /dev/null
