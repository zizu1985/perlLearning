package Ch7_Fibonacci;

use strict;
use warnings;
use diagnostics;
use Readonly;

our $VERSION=0.01;

Readonly $Ch7_Fibonacci::MIN => 1;
Readonly $Ch7_Fibonacci::MAX => 10;

sub make_fibonacci {
	my ($current, $next) = (0, 1);
	return sub {
		my $fibonnaci = $current;
		($current, $next) = ($next, $current + $next);
		return $fibonnaci;
	};
}


my $iterator = make_fibonacci();

for ($Ch7_Fibonacci::MIN .. $Ch7_Fibonacci::MAX) {
	my $fibonnaci = $iterator->();
	print $fibonnaci; print "\n";
}

=begin sds
asasqsqdcq@sad
=a

1;