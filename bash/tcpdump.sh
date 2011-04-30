# listen for traffic to / from example.com

sudo tcpdump -S -i eth0 host example.com

# show all udp, icmp or tcp packet traffic

sudo tcpdump -S udp

# show ethernet traffic / MAC addresses

sudo tcpdump -qeS -s 0 -i en1 port 8080

# im in ur web browzar, sniffin ur pakkitz

sudo tcpdump -vvvnSA -s 0 -i en1 port 80

# Show all hosts on the local subnet by
# performing reverse DNS lookups.
# Nameservers listed in resolv.conf

nmap -sL 10.0.1.0/24

# Find hosts that respond to pings.

nmap -sP -T4 --reason 10.0.1.0/24 

# show all packets sent and received by nmap

nmap -sP -T4 --reason --packet-trace 10.0.1.0/28

# Look for an open port in the 8k range

nc -vz 10.0.1.9 8000-8999 2> /dev/null

