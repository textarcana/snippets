def estimate

puts 'how long will it take?'
t1 = gets

puts 'no, *honestly,* how long will it take?
t2 = gets

puts 'in the absolute WORST case, how long would it take?'
t3 = gets


puts "\nOk then I estimate it will really take this long:"
puts ((t1 + (4*t2) + t3) / 6)

end