use strict;
use warnings;
use diagnostics;

sub make_fibonacci {
	my ($current, $next) = (0, 1);
	return sub {
		my $fibonnaci = $current;
		($current, $next) = ($next, $current + $next);
		return $fibonnaci;
	};
}

my $iterator = make_fibonacci();

for (1 .. 10) {
	my $fibonnaci = $iterator->();
	print $fibonnaci; print "\n";
}
