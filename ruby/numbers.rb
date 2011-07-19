# humanize
require 'humanize'

approximate_age_of_the_universe_in_English = (433 * 10**15).humanize

seconds_since_epoch_in_English = `date '+%s'`.to_i.humanize

# factorials

def factorial n
  (1..n).inject{|base,x| base * x }
end


# the golden ratio
PHI = (1 + Math.sqrt(5)) / 2

# triangular numbers
#
# This function can be used to compute complexity of communication.
# Think of it as the number of possible bi-directional connections in
# a network.  Or, more to the point, the number of ways a message can
# be passed between n people, see Brooks' Law

def triangular number
  (0..number).inject{|sum,x| sum + x }
end
