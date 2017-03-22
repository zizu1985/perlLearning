use v5.11;
use strict;
use warnings;
use lib 'Convert-Distance-Metric/Convert-Distance-Metric/lib';
use Convert::Distance::Metric ":all";

my $meters = kilometers_to_meters(3.5);
say $meters;
my $kilometers = meters_to_kilometers($meters);
say $kilometers;