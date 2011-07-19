# humanize
require 'humanize'

approximate_age_of_the_universe_in_English = (433 * 10**15).humanize

seconds_since_epoch_in_English = `date '+%s'`.to_i.humanize

# the golden ratio
PHI = (1 + Math.sqrt(5)) / 2

# factorials

def factorial n
  n == 0 and return 1
  (1..n).inject{|base,x| base * x }
end

# triangular numbers
#
# This function can be used to compute complexity of communication.
# Think of T(n-1) as the number of possible bi-directional connections
# in a network with n nodes.  Or, more to the point, the number of
# ways a message can be passed between n people, see Brooks' Law

def triangular number
  (0..number).inject{|sum,x| sum + x }
end

# odd numbers

def nth_odd number
  acc = []
  (2 * number).times {|i| acc.push i if i % 2 != 0}
  return acc.last
end

# hexagonal numbers
#
# can be used to calculate the number of ways to choose 2 colors from
# a color pallette of n^2 colors

def hexagonal number
  number == 0 and return 0
  triangular nth_odd(number)
end

# series

def series funkshun, max
  acc = []
  max.times {|i| acc.push send(funkshun, max) }
  acc
end
