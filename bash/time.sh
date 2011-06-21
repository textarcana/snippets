# get the age in seconds of the file foo.txt
# see http://www.noah.org/wiki/Test_file_age

$(($(date +%s) - $(stat -c '%Y' foo.txt)))
