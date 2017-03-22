package TestsFor::Person;
use Test::Most;
use base 'TestsFor';
use lib 'C:\Users\zizu\workspace\Chapter4_tests\lib';
use PersonMoose;
use DateTime;

sub class_to_test { 'PersonMoose' }

sub constructor : Tests(3) {
	my $test = shift;
	my $class = $test->class_to_test;
	can_ok $class, 'new';
	throws_ok { $class->new } qr/Attribute.*required/, "Creating a $class without proper attributes should fail";
	
	my $person = $class->new(
		name => 'Tomasz', birthday => DateTime->new(year => '1985')
		);
		
	isa_ok $person, $class;
}

sub default_person {
	my $test = shift;
	return $test->class_to_test->new(name => 'Tomasz');
}

sub name : Tests(2) {
	my ($test) = @_;
	my $class = $test->class_to_test;
	my $person = $test->default_person;
	can_ok $class,'get_name';
	is $person->get_name,'Tomasz','get_name should return Tomasz for default class';
}

1;