use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my %config;

while (<DATA>) {
	next if /^\s*#/; # skip comments
	next unless /(\w+)\s*=\s*(\w+)/; # key = value
	my ( $key, $value ) = ( $1, $2 );
	if ( exists $config{$key} ) {
	# we’ve already seen this key, so convert the value to an
	# array reference
	# Does $config{$key} currently store a scalar or an aref?
	if( ! ref $config{$key} ) {
		$config{$key} = [ $config{$key} ];
	}
		push @{ $config{$key} } => $value;
	}
	else {
		$config{$key} = $value;
	}
}

print Dumper(\%config);

print values %config;
	
__DATA__
timeout = 30
# only these people are OK
user = Ovid
user = Sally
user = Bob