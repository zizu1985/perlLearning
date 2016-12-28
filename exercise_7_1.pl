use strict;
use warnings;

sub average {
		my @numbers = @_;
		my ($avg,$total) = (0,0);
		
		foreach my $iter (0 .. $#{\@numbers})
		{			
			$total = $total + $numbers[$iter]; 
		}
		
		return $total / (scalar @numbers);
};


my $avg = average 1, 2, 3, 4;
print $avg."\n";

my $avg2 = average 1, 2, 3, 4, 0;
print $avg2;


