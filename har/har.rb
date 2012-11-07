# query a HAR (HTTP Archive) file that is loaded into the IRB
#
# See http://help.tenderapp.com/kb/troubleshooting-single-sign-on/generating-an-har-file

# Don't echo the result of commands. Useful if you're about to load a
# JSON file that is thousands of lines long.

irb_context.echo = false

require 'json'

d = JSON.load open('www.example.com.har')

# 
