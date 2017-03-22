use strict;
use warnings;
#use lib 'Convert-Distance-Metric/Convert-Distance-Metric/lib';

use Convert::Distance::Metric ":all";

my $meters = kilometers_to_meters(1.18);
print $meters;
