use strict;
use warnings;
use diagnostics;
use Carp 'croak';
use Data::Dumper;

sub zip(\@\@;$);

my @names = qw(alice bob charlie);
my @tests = qw(87 72);
my @final = qw(100 53 87);
my %test_grades = zip @names, @tests, 0;
my %final_grades = zip @names, @final;

# uncomment the following line to see how this breaks
#my %blows_up = zip @tests, @final;

print Dumper( \%test_grades, \%final_grades );

sub zip (\@\@;$) {
	my ( $first, $second, $default ) = @_;
	# if we don’t have a default, croak if arrays are not
	# the same length
	if ( @_ < 3 and ( @$first != @$second ) ) {
	croak "zip() arrays must be the same length without a default";
}

my $max_index = $#$first;
if ( $#$second > $max_index ) {
	$max_index = $#$second;
}

my @zipped;
for my $i ( 0 .. $max_index ) {
	my $first_value = $i <= $#$first ? $first->[$i] : $default;
	my $second_value = $i <= $#$second ? $second->[$i] : $default;
	push @zipped, $first_value, $second_value;
}

return @zipped;

}

