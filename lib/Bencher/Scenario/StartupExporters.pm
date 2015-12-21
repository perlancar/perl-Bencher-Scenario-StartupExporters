package Bencher::Scenario::StartupExporters;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark the startup time of some popular Exporter modules',

    module_startup => 1,

    participants => [
        {module=>'Exporter'},
        {module=>'Exporter::Tiny'},
        {module=>'Exporter::Tidy'},
        {module=>'Exporter::Rinci'},
        {module=>'Sub::Exporter'},
    ],
};

1;
# ABSTRACT:

=head1 SYNOPSIS
