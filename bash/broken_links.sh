# Retrieves links from a remote HTML page, then checks the response
# code of each link. Duplicated links are only checked once, and
# anchors are ignored. That is http://foo and http://foo#bar are
# considered to be the same URL, and thus http://foo will only be
# checked once; even if both URLs occur on the page.
#
# Note that if the command produces too much output for you, you can
# filter down to just the broken links (if any) by piping the output
# of the entire one-liner, to grep -v "200 OK"
#
# These dependencies must be installed on your system:
#
#     Perl
#     Crypt::SSLeay
#     lwp-request
#     sort
#     uniq

test -n $1 || exit "usage: broken_links.sh http://example.com"

export URL=$1

lwp-request -o links $URL | \
    perl -pe 'chomp; $_ =~ s{ ^ \w* \s* ( [^#]+ ) .* $ }{$1}x; undef $_ unless m/^http/; $_ = qq{\"$_\"\n} if $_' | \
    sort | \
    uniq | \
    perl -ne 'chomp; print $_ . qq{\t} . qx{lwp-request -ds $_}' | \
    grep -v "200 OK"
