# Show all hosts on the local subnet by
# performing reverse DNS lookups.
# Nameservers listed in resolv.conf

nmap -sL 10.0.1.0/24

# Discover hosts that respond to pings.

nmap -sP -T4 --reason 10.0.1.0/24 

# Discover hosts and show all packets sent and received by Nmap

nmap -sP -T4 --reason --packet-trace 10.0.1.0/28
