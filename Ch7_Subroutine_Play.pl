use strict;
use warnings;
use diagnostics;
use Params::Validate qw(validate validate_pos);
use Scalar::Util qw(looks_like_number);
use Carp qw(carp);
use Try::Tiny;
use Data::Dumper;
use Storable qw(dclone);

eval "use aa";
if ( my $error = $@ ) {
	carp "Cannot load aa module";
	print "\n";
}

my $multiplier = $ARGV[0];
die "Usage $0 positivenumber" if (not @ARGV or not looks_like_number($multiplier) or $multiplier < 1);

# function to return array
sub double {
	
	validate_pos (
		@_,
		1 ,
		1
	);
	
	my @input_array = @{$_[0]};
	my $multi = $_[1];
	my @output_array = map { $_ * $multi } @input_array;
	return wantarray ? @output_array : \@output_array;
	 
}

my @input = (1, 2);
print join ":" , @input;
print "\n";
my @output = double(\@input , $multiplier);
print join ":" , @output;
print "\n";

# Test try/catch in perl
foreach (0..3) {
	try {
		print 1/$_;
		print "\n";
	}	
	catch
	{
		carp "Error during maths: ";
	}
	finally {
		print "Trying math with value $_ \n";
	}
}

# subroutine reference
my $sub = \&double;
my @r = $sub->(\@output, 4);
print "\n";
 
@r = $sub->(\@output, 3);

# Call subroutine with incorrect prototype
sub sreverse($) {
	my $string = shift;
	return scalar reverse $string;
}

# Too many arguments for main::sreverse at C:/Users/zizu/workspace/Chapter4_tests/Ch7_Subroutine_Play.pl line 69, near ""that")"
# Execution of C:/Users/zizu/workspace/Chapter4_tests/Ch7_Subroutine_Play.pl aborted due to compilation errors (#1)
#    (F) The function requires fewer arguments than you specified.
#
#print sreverse("this", "that");

print "this", " ", sreverse("this");
print "\n";

sub random_die_rolls($@) {
	my ( $number_of_rolls, @number_of_sides ) = @_;
	my @results;
	foreach my $num_sides (@number_of_sides) {
		my $total = 0;
		$total += int( 1 + rand($num_sides) ) for 1 .. $number_of_rolls;
		push @results, $total;
	}
	return @results;
}

my @rolls = random_die_rolls 3 ,6 ,8, 12;
print join "\n", @rolls;



### Treat input hash as reference inside subroutine
print "\nPassing hash and operating on hash reference using prototypes\n";
###
 
sub my_lc(\%) {
	
	my $input_hash = shift;
	my %out_hash = % {dclone($input_hash)};
	my $ref = \%out_hash;
	
	foreach my $key (keys %out_hash) {
		next if ref $ref->{$key};
		$ref->{$key} = lc $ref->{$key}; 
	}
	
	return %out_hash;
		
}

my %my_hash = 
(
	a => "AA",
	b => [1 , 2, 3],
	c => "EE"
);

print Dumper(\%my_hash);
my %out = my_lc(%my_hash);
print Dumper(\%my_hash);
print Dumper(\%out);


