# See http://stackoverflow.com/questions/1032114/check-for-ruby-gem-availability

begin
  gem "cucumber", ">=0.10.5"
rescue Gem::LoadError
  puts 'Upgrading cucumber.'
  system 'sudo gem install cucumber'
end
