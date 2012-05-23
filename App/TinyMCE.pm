package App::TinyMCE;

use strict;
use warnings;
use version;

use base qw(CGI::Ex::App);
use CGI::Ex::Dump qw(debug);
use HTML::WikiConverter;

use FindBin;
our $base_path = $FindBin::RealBin;

our $VERSION = qv(0.1);

sub template_path { $base_path . '/templates' }

sub main_hash_swap {
    my $self = shift;
    return {};
}

sub main_finalize {
    my $self     = shift;
    my $f        = $self->{'form'};
    my $html     = $f->{'elm1'};
    my $strip_tags = [ '~comment', 'head', 'script', 'style', 'form' ];
    my $wc       = new HTML::WikiConverter(
        dialect => 'Markdown',
        strip_empty_tags => 1,
        escape_entities => 1,
        strip_tags => $strip_tags,
    );
    my $markdown = $wc->html2wiki($html);
    $f->{'output'} = $markdown;
    $self->set_ready_validate(0);
    return 1;
}

1;
