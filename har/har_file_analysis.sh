# HAR (HTTP Archive) file analysis
#
# See http://help.tenderapp.com/kb/troubleshooting-single-sign-on/generating-an-har-file

# Examine cookies

grep -A2 -i '"name": "Cookie"' www.example.com.har  | less
