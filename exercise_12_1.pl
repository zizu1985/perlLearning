use v5.11;
use strict;
use warnings;
use Try::Tiny;

use lib "lib";
use Person;
use Customer;

my $person = Person->new({ name => "Tomasz", birthday => DateTime->new(year => 1985, month => 9) });

my $age = $person->age;
my $name = $person->get_name;

say $person->get_name, ' has ' , $person->age , ' years';

# Test checking more input argeuments in constructor

try {
	my $person2 = Person->new({ name => "Tomasz", birthday => DateTime->new(year => 1985, month => 9), address => "Chocimska" });
	$age = $person2->age;
	$name = $person2->get_name;

	say "Person $name has $age";
	
}
catch {
	say "Error messgae is : $_";	
};

# Test checking birth in future

try {
	my $person3 = Person->new({ name => "Tomasz", birthday => DateTime->new(year => 2018, month => 9) });
	$age = $person3->age;
	$name = $person3->get_name;

	say "Person $name has $age";
	
}
catch {
	say "Error messgae is : $_";	
};

# Customer test

my $customer = Customer->new({ name => "Goliat", birthday => DateTime->new(year => 1983, month => 2) });
$age = $customer->age;
$name = $customer->get_name;

say "Customer $name has $age";

try {
	my $customer2 = Customer->new({ name => "Frick", birthday => DateTime->new(year => 2013, month => 9) });
	$age = $customer2->age;
	$name = $customer2->get_name;

	say "Customer $name has $age";
	
}
catch {
	say "Error messgae is : $_";	
};