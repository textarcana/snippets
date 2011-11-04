#/usr/bin/perl -w
use strict;

# Get the diff between two timestamps

use DateTime; 
my $dt = DateTime->from_epoch( epoch => $currenttime );
my $bts = DateTime->from_epoch( epoch => $buildTimeStamp );
my $tdiff = $dt - $bts;
my $tmin = ($tdiff->hours * 60) + $tdiff->minutes;
