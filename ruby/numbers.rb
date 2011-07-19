# humanize
require 'humanize'

approximate_age_of_the_universe_in_English = (433 * 10**15).humanize

seconds_since_epoch_in_English = `date '+%s'`.to_i.humanize

# the golden ratio
PHI = (1 + Math.sqrt(5)) / 2

# factorials

def factorial n
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
