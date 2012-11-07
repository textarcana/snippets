# query a HAR (HTTP Archive) file that is loaded into the IRB
#
# See http://help.tenderapp.com/kb/troubleshooting-single-sign-on/generating-an-har-file

# Don't echo the result of commands. Useful if you're about to load a
# JSON file that is thousands of lines long.

irb_context.echo = false

require 'json'

document = JSON.load open('www.example.com.har')

# an array containing the record of each request and response, in
# chronological order

entries = document['log']['entries']

# make a hash table of all request and response cookies

cookies = d['log']['entries'].map {|i| {'request' => i['request']['cookies'], 'response' => i['response']['cookies']}}
