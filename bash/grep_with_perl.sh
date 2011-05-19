# multi-line search with Perl

perl -lne 'BEGIN{undef $/}; m/(\?>\s+$)/ and exit 1'