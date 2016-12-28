use strict;
use warnings;

sub make_multiplier ($);

my $times_seven = make_multiplier(7);
my $times_five = make_multiplier(5);
print 21 == $times_seven->(3) ? "yes\n" : "no\n";
print 20 == $times_five->(4) ? "yes\n" : "no\n";

sub make_multiplier ($) {
	
		my ($first) = @_;
		return sub {
			my ($second) = @_;
			return $first * $second;
		};
		
};


