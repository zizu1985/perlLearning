use strict;
use warnings;
use v5.11;
use lib 'lib';

use Unique ':ALL';

my @input = (1,2,3,1,4,1,2);
say @input;
my @output = unique(@input);
say @output;

