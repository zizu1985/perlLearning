use strict;
use warnings;
use Data::Dumper;

my $employee_numbers = <<'END_EMPLOYEES';
	alice: 48472
	bob:34582
	# we need to fi re charlie
	charlie : 45824
	# denise is a new hire
	denise : 34553
END_EMPLOYEES

my %employees=();

my $regex = qr/[^#](?<name>[[:alpha:]]+?)\s*:\s*(?<number>[[:digit:]]+?)\b/;

while ($employee_numbers =~ /$regex/g) {
	$employees{$+{name}}=$+{number};
}

print Dumper(\%employees);