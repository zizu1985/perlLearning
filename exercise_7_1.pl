use strict;
use warnings;

sub average {
		my @numbers = @_;
		my ($avg,$total) = (0,0);
		
		foreach my $iter (0 .. $#{\@numbers})
		{			
			
				no warnings 'numeric';
				$total +=  $numbers[$iter];
			
		}
		
		return $total / (scalar @numbers);
};

sub avg (\@) {
		my ($reference) = @_;
		my ($avg,$total) = (0,0);
		foreach my $number (@$reference) {
					no warnings 'numeric';
					$total += $number;
				
			}
		
		return $total / @$reference;
};


my $avg = average 1, 2, 3, 4;
print $avg."\n";

my $avg2 = average 1, 2, 3, 4, 0;
print $avg2."\n";

my @testArr = qw(10 5 10 8 2 8);
my $avg3 = avg(@testArr);

print $avg3."\n";

# undef - traktowane jako 0
my @testArr2 = qw(10 5 10 8 2 8 undef 1);
my $avg4 = avg(@testArr2);

print $avg4."\n";


