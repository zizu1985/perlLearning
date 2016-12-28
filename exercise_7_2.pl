use strict;
use warnings;
use Carp qw(croak);
use Scalar::Util qw(looks_like_number);
use feature qw(say);

sub average {
		my @numbers = @_;
		my ($avg,$total) = (0,0);

				
		foreach my $iter (0 .. $#{\@numbers})
		{
			looks_like_number($numbers[$iter]) || croak "Element $numbers[$iter] is not number! ";			
			$total = $total + $numbers[$iter]; 
		}
		
		return $total / (scalar @numbers);
};


say average(1, 2, 3, 4);
say average(1, 2, 3);
say average(1, 2, 'a');


