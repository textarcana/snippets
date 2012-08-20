# seconds since epoch mod 10 provides a sequential index from 1 to 10,
# incremented every clock second

loop { i=Time.now.to_i % 10; n=Time.now; s=Time.now.to_i; puts "#{i}\t#{s}\t#{n}"; sleep 1 }

# mod 30 provides a 30-second-long repeating sequence, mod 60 a
# one-minute seqence, etc.
