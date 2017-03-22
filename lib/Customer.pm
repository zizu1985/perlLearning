package Customer;
use strict;
use warnings;
use lib 'lib';
use Carp qw(croak);

use base 'Person';

sub _set_birthday {
	
	my ($self,$birth) = @_;
	my $now = DateTime->now;
	my $duration = $now - $birth;
	my $years = $duration->years;
	
	if ( $years < 18 ) {
		croak "Cannot accept customers with age below 18";
	} 
	
	$self->SUPER::_set_birthday($birth);
	
} 








1;