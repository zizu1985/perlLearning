use v5.11;
use strict;
use warnings;
use lib 'lib';

use DateTime;
use PersonMoose;
use CustomerMoose;
use Try::Tiny;
use Carp qw(croak);

try {
	my $adult = PersonMoose->new(name => 'Tomasz', birthday => DateTime->new(year => '1985'));
	say $adult->as_string;
	my $child = PersonMoose->new(name => 'Katarzyna', birthday => DateTime->new(year => '2007'));
	say $child->as_string;
	my $customer = CustomerMoose->new(name => 'Ludek', birthday => DateTime->new(year => '1981'));
	say $customer->as_string;
}
catch {
	croak "Error $_!";
};