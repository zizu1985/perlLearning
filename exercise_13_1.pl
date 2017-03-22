use v5.11;
use strict;
use warnings;
use lib 'lib';

use User;
use Try::Tiny;
use Carp qw(croak);
use Data::Dumper;

try {
	my $user = User->new(username => 'Ludek', password => 'dupa');
	say "User " . $user->get_username . " has " . $user->get_password  . " password digest.";
	say Dumper($user->my_dump);
	say $user->dump;
}
catch {
	croak "Error $_!";
};