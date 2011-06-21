# humanize
require 'humanize'

approximate_age_of_the_universe_in_English = (433 * 10**15).humanize

seconds_since_epoch_in_English = `date '+%s'`.to_i.humanize

# factorials
puts "factorial 5: " + 5.downto(1).inject(:*)

# the golden ratio
PHI = (1 + Math.sqrt(5)) / 2
