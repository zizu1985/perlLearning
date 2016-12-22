use strict;
use warnings;
use diagnostics;
use Params::Validate qw(validate validate_pos);
use Scalar::Util qw(looks_like_number);
use Carp qw(carp);
use Try::Tiny;

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
print join ":" , @r;
print "\n";
 
@r = $sub->(\@output, 3);