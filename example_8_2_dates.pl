use strict;
use warnings;
use Data::Dumper;

my @dates = qw(
01/23/1987
11/30/2000
02/29/1980
);

foreach (@dates) {
s{\A(\d\d)/(\d\d)/}
{$2/$1/};
}

print Dumper(\@dates);