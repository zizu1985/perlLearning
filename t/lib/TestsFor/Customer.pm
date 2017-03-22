package TestsFor::Customer;
use Test::Most;
use DateTime;
#use lib '.';
use CustomerMoose;
use base 'TestsFor::Person';

sub class_to_test {'CustomerMoose'}

sub minimum_age : Tests(2)  {
	my $test = shift;
	my $year = DateTime->now->year;
	$year -= 16;
	throws_ok { 
		$test->class_to_test->new(
			name => 'Beata Cyberna',
			birthday => DateTime->new(year => $year)
		);
	}
	qr/^Customer has to have more than 18 years/,
	'Try to create a customer with less than 18 years. Should throw error';
	
	$year -= 30;
	lives_ok {
		$test->class_to_test->new(
			name => 'Kazik Ziutek',
			birthday => DateTime->new(year => $year)
		)
	}
	'Try to create a customer with more than 18 years.'
}

sub default_person {
	my $test = shift;
	return $test->class_to_test->new(name => 'Tomasz',birthday => DateTime->new(year => 1900));
}

1;