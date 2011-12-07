# get the age in seconds of the file foo.txt
# see http://www.noah.org/wiki/Test_file_age

$(($(date +%s) - $(stat -c '%Y' foo.txt)))


# convert seconds since epoch to human-readable string
#
# Mac

date -r 1320415254 "+%Y-%m-%d %H:%M:%S"

# CentOS

date -d@1320415254

# zdump prints local time for any time zone

zdump America/Chicago

# To read the list of valid time zones

less `locate zone.tab`
