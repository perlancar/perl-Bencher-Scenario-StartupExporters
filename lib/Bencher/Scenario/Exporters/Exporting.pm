package Bencher::Scenario::Exporters::Exporting;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use File::Temp qw(tempdir);
use File::Slurper qw(write_text);

my $tempdir = tempdir(CLEANUP => 1);
write_text("$tempdir/ExampleExporter.pm",              'package ExampleExporter;              use Exporter qw(import);                  our @EXPORT = qw(e1 e2 e3); sub e1{} sub e2{} sub e3{} 1;');
write_text("$tempdir/ExampleExporterLite.pm",          'package ExampleExporterLite;          use Exporter::Lite qw(import);            our @EXPORT = qw(e1 e2 e3); sub e1{} sub e2{} sub e3{} 1;');
write_text("$tempdir/ExamplePERLANCARExporterLite.pm", 'package ExamplePERLANCARExporterLite; use PERLANCAR::Exporter::Lite qw(import); our @EXPORT = qw(e1 e2 e3); sub e1{} sub e2{} sub e3{} 1;');
write_text("$tempdir/ExampleExporterRinci.pm",         'package ExampleExporterRinci;         use Exporter::Rinci qw(import);           our @EXPORT = qw(e1 e2); our %SPEC; sub e1{} sub e2{} $SPEC{e3}={v=>1.1, tags=>[q/export:default/]}; sub e3{} 1;');
write_text("$tempdir/ExamplePerinciExporter.pm",       'package ExamplePerinciExporter;       use Perinci::Exporter;                    our @EXPORT = qw(e1 e2); our %SPEC; sub e1{} sub e2{} $SPEC{e3}={v=>1.1, tags=>[q/export:default/]}; sub e3{} 1;');

our $scenario = {
    summary => 'Benchmark overhead of exporting',

    modules => {
        'PERLANCAR::Exporter::Lite' => {version=>0.02},
    },

    participants => [
        {name=>"Exporter", cmdline => [$^X, "-I$tempdir", "-MExampleExporter", "-e1"]},
        {name=>"Exporter::Lite", cmdline => [$^X, "-I$tempdir", "-MExampleExporterLite", "-e1"]},
        {name=>"Exporter::Rinci", cmdline => [$^X, "-I$tempdir", "-MExampleExporterRinci", "-e1"]},
        {name=>"Perinci::Exporter", cmdline => [$^X, "-I$tempdir", "-MExamplePerinciExporter", "-e1"]},
        {name=>"PERLANCAR::Exporter::Lite", cmdline => [$^X, "-I$tempdir", "-MExamplePERLANCARExporterLite", "-e1"]},
        {name=>"perl -e1 (baseline)", cmdline => [$^X, "-e1"]},
    ],
};

1;
# ABSTRACT:
