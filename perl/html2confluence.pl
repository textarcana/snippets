#/usr/bin/perl -w
use strict;
use HTML::WikiConverter;

my $path = shift;
my $wc = new HTML::WikiConverter( dialect => 'Confluence' );
# fetch html from a file
print $wc->html2wiki( file => $path );


=head1 NAME

How to use the HTML to Confluence converter from CPAN

=head1 SYNOPSIS

    perl html2confluence.pl <file>

=cut

