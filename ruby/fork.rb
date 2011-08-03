# fork off a child process whose execution does not block the further
# execution of this script

pid = fork do
  sleep 10
  File.open("hello_world.txt", 'a') {|f| f.puts('hi world')}
  puts '...then a file gets printed 10 seconds later'
end
Process.detach(pid)

puts 'this is displayed immediately, and the script exits...'
