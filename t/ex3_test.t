use Test::Most;
use Carp 'croak';
use Scalar::Util 'looks_like_number';
use v5.11;
use Try::Tiny;

sub reciprocal {
	
	my $number = shift;
	# Tested error only if argument is not a number
	unless ( looks_like_number($number) ) {
		croak("Argument to reciprocal() must be a number");
	}
	# Division by zero is forbiden
	unless ( $number <=> 0 ) {
		croak("Illegal division by zero");
	}
	return 1 / $number;
	
}

# Trivial test 
is reciprocal(1),1,'Canonical for 1 should be 1';
try {
	diag reciprocal(1);
}
catch {
	diag("Error: @_");
};

# Checking if empty array is invalid argument. Should be.
throws_ok { reciprocal([]) } 
	qr/Argument to reciprocal\(\) must be a number/,'Passing non-numbers to reciprocal() should fail';
	
try {
	diag reciprocal([]);
}
catch {
	diag("Error: @_");
};

throws_ok { reciprocal(0) }
	qr/Illegal division by zero/,'Passing 0 to reciprocal() should fail';	

done_testing();
