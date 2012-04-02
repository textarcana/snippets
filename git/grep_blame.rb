#!/usr/bin/env ruby

# Grep for a string and then git blame the lines that match. Written
# by Ramin Bozorgzadeh.
#
# Eg:
#       grep_blame.rb "attr\([\"\']checked[\"\']\)" htdocs/assets/js

grep = `git grep -n #{ARGV[0]} #{ARGV[1]}`

puts "\n-----------------------------------------------------------"
puts "GREP RESULT"
puts '-----------------------------------------------------------'
puts grep

files = grep.scan /.*\:\d+/

interrupt = false

files.each do |file_with_line|
  exit if interrupt

  puts "\n-----------------------------------------------------------"
  puts file_with_line
  puts '-----------------------------------------------------------'
  file, line = file_with_line.split(':')
  system "git blame -L #{line},#{line} #{file}"
  
  trap('INT'){interrupt = true}
  sleep 0.4 

end