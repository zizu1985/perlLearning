package Unique;
use strict;
use warnings;
use Exporter::NoWork;

sub unique {
	my @array = @_;
	my %hash = map { $_ => 1 } @array;
	return keys %hash;
}

1;