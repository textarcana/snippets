# fork off a child process whose execution does not block the further
# execution of this script

foo = 1

pid = fork do
  puts "foo is #{foo}"
  sleep 2
  File.open("hello_world.txt", 'a') {|f| f.puts('hi world')}
  puts '...then a file gets printed 2 seconds later'
end
Process.detach(pid)

puts 'this is displayed immediately, and the script exits...'
