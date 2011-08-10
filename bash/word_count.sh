# Count lines and print a running count while the count is in
# progress.  Gives you something to watch while counting lines in a
# really long log file.
#
# See also http://www.perlmonks.org/?node_id=171771

perl -ne 'BEGIN{$i=0;$|++} $i++; print "\r$i";END{print "\n"}' really_long_logfile
