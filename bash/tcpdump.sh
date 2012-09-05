# listen for traffic to / from example.com

sudo tcpdump -S -i eth0 host example.com

# minimal output

sudo tcpdump -qt port 80

# show all udp, icmp or tcp packet traffic

sudo tcpdump -S udp

# ethernet traffic / MAC addresses

sudo tcpdump -qte -s 0 -i en1

# http traffic originating from a specific subnet

sudo tcpdump -S -s 0 port 80 and net 10.9.8.0/24

sudo tcpdump -Sn net 10.9.0.0/16

# show Web traffic and display ASCII text (HTML) contained in packets

sudo tcpdump -vvvSA -s 0 -i en1 port 80

# just show what's in the packets 
# (bytes on the left, ASCII on the right)

sudo tcpdump -qXX -s 0 port 80

# extreme packet pr0n

sudo tcpdump -vvvSeXX -s 0 port 80

# Show all hosts on the local subnet by
# performing reverse DNS lookups.
# Nameservers listed in resolv.conf

nmap -sL 10.0.1.0/24

# Discover hosts that respond to pings.

nmap -sP -T4 --reason 10.0.1.0/24 

# Discover hosts and show all packets sent and received by Nmap

nmap -sP -T4 --reason --packet-trace 10.0.1.0/28

# Look for an open port in the 8k range

nc -vz 10.0.1.9 8000-8999 2> /dev/null

# capture traffic for later viewing in wireshark

tcpdump -w somefile.cap -s 1500 -n -i en1 net 10.0.1.9

# show incoming traffic from external hosts

sudo tcpdump -Sn dst net 10.0.0.0/16 and not src net 10.0.0.0/16

# show conversations with external hosts

sudo tcpdump -S \(dst net 10.0.0.0/16 and src net not 10.0.0.0/16\) or \
    \(src net 10.0.0.0/16 and dst net not 10.0.0.0/16\)

# show incoming data from from either Cassandra or Oracle

sudo tcpdump -SnX \(src port 9160 or src port 1521\)
