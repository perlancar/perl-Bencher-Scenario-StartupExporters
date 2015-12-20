package Bencher::Scenario::StartupExporters;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
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
# ABSTRACT: Benchmark startup time of some popular Perl Getopt modules

=head1 SYNOPSIS

 % bencher -m StartupGetoptModules [other option]...
