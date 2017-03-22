use strict;
use warnings;

use lib 'lib';
use Person;

my $person = Person->new({ name => "QWERTY", birthday => DateTime->now });
print $person->get_name;


1;