# See http://stackoverflow.com/questions/2232/calling-bash-commands-from-ruby

begin
  gem "cucumber", ">=0.10.5"
rescue Gem::LoadError
  puts 'Upgrading cucumber.'
  system 'sudo gem install cucumber'
end
