use strict;
use warnings;
use feature 'say';

say scalar localtime;

sub sum {
	my @arg = @_;
	return $arg[0] if @_ == 1;
	return 0 if @_ < 1;
	
	my $middle = int( $#{\@arg} / 2);
	my @left = @arg[0..$middle];
	my @right = @arg[$middle+1..$#{\@arg}];
	return sum(@left) + sum(@right);		
}

my @input_arr = map { $_ * 3 } (1 .. 999999);
say sum @input_arr;

say scalar localtime;