# Count lines and print a running count while the count is in
# progress.  Gives you something to watch while counting lines in a
# really long log file.

perl -ne 'BEGIN{$i=0;$|++} $i++; print "\r$i";END{print "\n"}' reall_long_logfile
