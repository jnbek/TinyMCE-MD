package TinyMCE_MD;

use strict;
use warnings;

use base qw(CGI::Ex::App);
use CGI::Ex::Dump qw(debug);
use HTML::WikiConverter;

use FindBin;
our $base_path = $FindBin::RealBin;

sub main_hash_swap {
    my $self = shift;
}
sub main_finalize {
    my $self = shift;
}

1;
