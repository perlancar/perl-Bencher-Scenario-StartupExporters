package Bencher::Scenario::Exporters::Startup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark the startup overhead of some exporter modules',

    modules => {
        'PERLANCAR::Exporter::Lite' => {version=>0.02},
    },

    module_startup => 1,

    participants => [
        {module=>'Exporter'},
        {module=>'Exporter::Lite'},
        {module=>'Exporter::Tiny'},
        {module=>'Exporter::Tidy'},
        {module=>'Exporter::Rinci'},
        {module=>'PERLANCAR::Exporter::Lite'},
        {module=>'Sub::Exporter'},
        {module=>'Xporter'},
    ],
};

1;
# ABSTRACT:

=head1 DESCRIPTION

Some notes:

=over

=item * L<Exporter::Lite> not so lite

Despite the C<::Lite> in its name and having less features than L<Exporter>, the
startup overhead is worse than Exporter (mostly due to the use of L<warnings>).

Also, this module is no longer necessary since Exporter 5.57 (2004), since
Exporter can be used without subclassing, all you have to do is:

 use Exporter qw(import);

=back
