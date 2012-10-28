def estimate

  puts 'best case, how many points of effort?'
  t1 = gets

  puts 'given current conditions, how many points?'
  t2 = gets

  puts 'in the absolute WORST case, how many points would it take?'
  t3 = gets


  puts "\nOk then I estimate it will really take this long:"
  puts ((t1.to_i + (4 * t2.to_i) + t3.to_i) / 6).to_s

end

estimate
